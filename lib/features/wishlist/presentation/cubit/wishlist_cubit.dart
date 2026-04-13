import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlistUseCase getWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;

  WishlistCubit({
    required this.getWishlistUseCase,
    required this.removeFromWishlistUseCase,
  }) : super(WishListInitialState());

  List<Product> products = [];

  Future<void> getWishlist() async {
    emit(WishListLoadingState());
    var response = await getWishlistUseCase();
    response.fold((l) => emit(WishListErrorState()), (r) {
      products = r.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishListSuccessState());
    });
  }

  Future<void> removeFromsWishlist(int productID) async {
    emit(WishListLoadingState());
    var response = await removeFromWishlistUseCase(productID);
    response.fold((l) => emit(WishListErrorState()), (r) {
      products = r.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishListSuccessState());
    });
  }
}
