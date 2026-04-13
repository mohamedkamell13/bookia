import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/data.dart';
import 'package:dartz/dartz.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, Data>> getCart();
  Future<Either<Failure, Data>> addToCart(int productId);
  Future<Either<Failure, Data>> removeFromCart(int cartItemId);
  Future<Either<Failure, Data>> updateCart(int cartItemId, int quantity);
  Future<Either<Failure, bool>> checkout();
}
