import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/models/wish_list_response/data.dart';
import 'package:bookia/features/wishlist/domain/repository/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class GetWishlistUseCase {
  final WishlistRepo wishlistRepo;
  GetWishlistUseCase(this.wishlistRepo);

  Future<Either<Failure, Data>> call() async {
    return await wishlistRepo.getWishlist();
  }
}
