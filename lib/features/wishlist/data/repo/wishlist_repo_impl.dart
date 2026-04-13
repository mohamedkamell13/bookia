import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:bookia/features/wishlist/data/models/wish_list_response/data.dart';
import 'package:bookia/features/wishlist/domain/repository/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class WishlistRepoImpl implements WishlistRepo {
  final WishlistRemoteDataSource wishlistRemoteDataSource;
  WishlistRepoImpl(this.wishlistRemoteDataSource);

  @override
  Future<Either<Failure, Data>> getWishlist() async {
    return await wishlistRemoteDataSource.getWishlist();
  }

  @override
  Future<Either<Failure, Data>> addToWishlist(int productId) async {
    return await wishlistRemoteDataSource.addToWishlist(productId);
  }

  @override
  Future<Either<Failure, Data>> removeFromWishlist(int productId) async {
    return await wishlistRemoteDataSource.removeFromWishlist(productId);
  }
}
