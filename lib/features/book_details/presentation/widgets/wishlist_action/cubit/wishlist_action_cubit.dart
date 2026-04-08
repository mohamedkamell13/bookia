import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/book_details/presentation/widgets/wishlist_action/cubit/wishlist_icon_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionsInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionsState());
    var response = await WishlistRepo.addToWishlist(productId);
    response.fold((l) => emit(WishlistActionsErrorState()), (r) {
      SharedPref.cacheWishlistIds(r.products ?? []);
      emit(WishlistActionsSuccessState(msg: 'addedToWishlist'.tr()));
    });
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionsState());
    var response = await WishlistRepo.removeFromWishlist(productId);
    response.fold((l) => emit(WishlistActionsErrorState()), (r) {
      SharedPref.cacheWishlistIds(r.products ?? []);
      emit(WishlistActionsSuccessState(msg: 'removedFromWishlist'.tr()));
    });
  }

  bool isProductInWishlist(int productId) {
    var wishlistIds = SharedPref.getWishlistIds();
    return wishlistIds.contains(productId);
  }
}
