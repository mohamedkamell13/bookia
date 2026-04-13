import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/models/wish_list_response/data.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRepo {
  Future<Either<Failure, Data>> getWishlist();
  Future<Either<Failure, Data>> addToWishlist(int productId);
  Future<Either<Failure, Data>> removeFromWishlist(int productId);
}
