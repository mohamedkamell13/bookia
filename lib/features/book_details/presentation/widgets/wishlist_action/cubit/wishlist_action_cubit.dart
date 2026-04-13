import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/book_details/presentation/widgets/wishlist_action/cubit/wishlist_icon_state.dart';
import 'package:bookia/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  final AddToWishlistUseCase addToWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;

  WishlistActionCubit({
    required this.addToWishlistUseCase,
    required this.removeFromWishlistUseCase,
  }) : super(WishlistActionsInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionsState());
    var response = await addToWishlistUseCase(productId);
    response.fold((l) => emit(WishlistActionsErrorState()), (r) {
      SharedPref.cacheWishlistIds(r.products ?? []);
      emit(WishlistActionsSuccessState(msg: 'addedToWishlist'.tr()));
    });
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionsState());
    var response = await removeFromWishlistUseCase(productId);
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
