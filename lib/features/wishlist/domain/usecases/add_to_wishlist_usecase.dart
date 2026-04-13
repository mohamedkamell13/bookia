import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/models/wish_list_response/data.dart';
import 'package:bookia/features/wishlist/domain/repository/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class AddToWishlistUseCase {
  final WishlistRepo wishlistRepo;
  AddToWishlistUseCase(this.wishlistRepo);

  Future<Either<Failure, Data>> call(int productId) async {
    return await wishlistRepo.addToWishlist(productId);
  }
}
