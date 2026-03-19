import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/book_details/presentation/widgets/wishlist_action/cubit/wishlist_icon_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<DetailsState> {
  WishlistActionCubit() : super(DetailsInitialState());

  Future<void> addTosWishlist(int productID) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo.addToWishlist(productID);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(DetailsSuccessState(msg: 'Added To wishlist'));
    } else {
      emit(DetailsErrorState());
    }
  }

  Future<void> removeFromWishlist(int productID) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo.removeFromWishlist(productID);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(DetailsSuccessState(msg: 'removed from wishlist'));
    } else {
      emit(DetailsErrorState());
    }
  }

  bool isProductInWishlist(int productId) {
    var wishListids = SharedPref.getWishlistIds();
    return wishListids.contains(productId);
  }
}
