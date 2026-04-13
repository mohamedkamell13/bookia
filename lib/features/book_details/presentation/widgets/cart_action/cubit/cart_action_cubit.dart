import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/book_details/presentation/widgets/cart_action/cubit/cart_action_state.dart';
import 'package:bookia/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionCubit extends Cubit<CartActionState> {
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;

  CartActionCubit({
    required this.addToCartUseCase,
    required this.removeFromCartUseCase,
  }) : super(CartActionsInitial());

  Future<void> addToCart(int productId) async {
    emit(CartActionsLoadingState());
    var response = await addToCartUseCase(productId);
    response.fold((l) => emit(CartActionsErrorState()), (r) {
      SharedPref.cacheCartIds(r.cartItems ?? []);
      emit(CartActionsSuccessState(msg: 'addedToCart'.tr()));
    });
  }

  Future<void> removeFromCart(int productId) async {
    emit(CartActionsLoadingState());
    var response = await removeFromCartUseCase(productId);
    response.fold((l) => emit(CartActionsErrorState()), (r) {
      SharedPref.cacheCartIds(r.cartItems ?? []);
      emit(CartActionsSuccessState(msg: 'removedFromCart'.tr()));
    });
  }

  bool isProductInCart(int productId) {
    var cartIds = SharedPref.getCartIds();
    return cartIds.contains(productId);
  }
}
