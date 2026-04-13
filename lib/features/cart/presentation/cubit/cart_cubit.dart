import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/domain/usecases/checkout_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final CheckoutUseCase checkoutUseCase;

  CartCubit({
    required this.getCartUseCase,
    required this.removeFromCartUseCase,
    required this.updateCartUseCase,
    required this.checkoutUseCase,
  }) : super(CartInitialState());

  List<CartItem> products = [];
  String total = '';

  Future<void> getCart() async {
    emit(CartLoadingState());
    var response = await getCartUseCase();
    response.fold((l) => emit(CartErrorState()), (r) {
      products = r.cartItems ?? [];
      total = r.total?.toString() ?? '';
      SharedPref.cacheCartIds(products);
      emit(CartSuccessState());
    });
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    var response = await removeFromCartUseCase(cartItemId);
    response.fold((l) => emit(CartErrorState()), (r) {
      products = r.cartItems ?? [];
      total = r.total?.toString() ?? '';
      SharedPref.cacheCartIds(products);
      emit(CartSuccessState());
    });
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    var response = await updateCartUseCase(cartItemId, quantity);
    response.fold((l) => emit(CartErrorState()), (r) {
      products = r.cartItems ?? [];
      total = r.total?.toString() ?? '';
      SharedPref.cacheCartIds(products);
      emit(CartSuccessState());
    });
  }

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    var response = await checkoutUseCase();
    response.fold(
      (l) => emit(CheckoutErrorState()),
      (r) => emit(CheckoutSuccessState()),
    );
  }
}
