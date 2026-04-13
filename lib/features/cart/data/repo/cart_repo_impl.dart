import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:bookia/features/cart/data/models/cart_response/data.dart';
import 'package:bookia/features/cart/domain/repository/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<Either<Failure, Data>> getCart() async {
    return await cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failure, Data>> addToCart(int productId) async {
    return await cartRemoteDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failure, Data>> removeFromCart(int cartItemId) async {
    return await cartRemoteDataSource.removeFromCart(cartItemId);
  }

  @override
  Future<Either<Failure, Data>> updateCart(int cartItemId, int quantity) async {
    return await cartRemoteDataSource.updateCart(cartItemId, quantity);
  }

  @override
  Future<Either<Failure, bool>> checkout() async {
    return await cartRemoteDataSource.checkout();
  }
}
