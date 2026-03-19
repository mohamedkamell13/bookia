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
    var data = await WishlistRepo.getWishlist();
    if (data != null) {
      products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishListSuccessState());
    } else {
      emit(WishListErrorState());
    }
  }

  Future<void> removeFromsWishlist(int productID) async {
    emit(WishListLoadingState());
    var data = await WishlistRepo.removeFromWishlist(productID);
    if (data != null) {
      products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishListSuccessState());
    } else {
      emit(WishListErrorState());
    }
  }
}
