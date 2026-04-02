import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/Cart/data/repo/Cart_repo.dart';
import 'package:bookia/features/book_details/presentation/widgets/cart_action/cubit/cart_action_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionCubit extends Cubit<CartActionState> {
  CartActionCubit() : super(CartActionsInitial());

  Future<void> addToCart(int productId) async {
    emit(CartActionsLoadingState());
    var data = await CartRepo.addToCart(productId);
    if (data != null) {
      var products = data.data?.cartItems ?? [];
      SharedPref.cacheCartIds(products);
      emit(CartActionsSuccessState(msg: 'addedToCart'.tr()));
    } else {
      emit(CartActionsErrorState());
    }
  }

  Future<void> removeFromCart(int productId) async {
    emit(CartActionsLoadingState());
    var data = await CartRepo.removeFromCart(productId);
    if (data != null) {
      var products = data.data?.cartItems ?? [];
      SharedPref.cacheCartIds(products);
      emit(CartActionsSuccessState(msg: 'removedFromCart'.tr()));
    } else {
      emit(CartActionsErrorState());
    }
  }

  bool isProductInCart(int productId) {
    var cartIds = SharedPref.getCartIds();
    return cartIds.contains(productId);
  }
}
