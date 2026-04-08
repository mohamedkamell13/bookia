import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishListInitialState());

  List<Product> products = [];

  Future<void> getWishlist() async {
    emit(WishListLoadingState());
    var response = await WishlistRepo.getWishlist();
    response.fold((l) => emit(WishListErrorState()), (r) {
      products = r.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishListSuccessState());
    });
  }

  Future<void> removeFromsWishlist(int productID) async {
    emit(WishListLoadingState());
    var response = await WishlistRepo.removeFromWishlist(productID);
    response.fold((l) => emit(WishListErrorState()), (r) {
      products = r.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishListSuccessState());
    });
  }
}
