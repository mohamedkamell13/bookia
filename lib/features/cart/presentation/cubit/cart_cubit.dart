import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  List<CartItem> products = [];
  String total = '';

  Future<void> getCart() async {
    emit(CartLoadingState());
    var response = await CartRepo.getCart();
    response.fold((l) => emit(CartErrorState()), (r) {
      products = r.cartItems ?? [];
      total = r.total?.toString() ?? '';
      SharedPref.cacheCartIds(products);
      emit(CartSuccessState());
    });
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    var response = await CartRepo.removeFromCart(cartItemId);
    response.fold((l) => emit(CartErrorState()), (r) {
      products = r.cartItems ?? [];
      total = r.total?.toString() ?? '';
      SharedPref.cacheCartIds(products);
      emit(CartSuccessState());
    });
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    var response = await CartRepo.updateCart(cartItemId, quantity);
    response.fold((l) => emit(CartErrorState()), (r) {
      products = r.cartItems ?? [];
      total = r.total?.toString() ?? '';
      SharedPref.cacheCartIds(products);
      emit(CartSuccessState());
    });
  }

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    var response = await CartRepo.checkout();
    response.fold(
      (l) => emit(CheckoutErrorState()),
      (r) => emit(CheckoutSuccessState()),
    );
  }
}
