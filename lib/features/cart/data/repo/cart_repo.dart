import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/data.dart';
import 'package:dartz/dartz.dart';

class CartRepo {
  static Map<String, dynamic> get _authHeader => {
    "Authorization": "Bearer ${SharedPref.getToken()}",
  };

  static Future<Either<Failure, Data>> getCart() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.cart,
      headers: _authHeader,
    );
    return response.fold(
      (l) => left(l),
      (right) => Right(Data.fromJson(right)),
    );
  }

  static Future<Either<Failure, Data>> addToCart(int productId) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.addToCart,
      data: {"product_id": productId},
      headers: _authHeader,
    );
    return response.fold(
      (l) => left(l),
      (right) => Right(Data.fromJson(right)),
    );
  }

  static Future<Either<Failure, Data>> removeFromCart(int cartItemId) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.removeFromCart,
      data: {"cart_item_id": cartItemId},
      headers: _authHeader,
    );
    return response.fold(
      (l) => left(l),
      (right) => Right(Data.fromJson(right)),
    );
  }

  static Future<Either<Failure, Data>> updateCart(
    int cartItemId,
    int quantity,
  ) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.updateCart,
      data: {"cart_item_id": cartItemId, "quantity": quantity},
      headers: _authHeader,
    );
    return response.fold(
      (l) => left(l),
      (right) => Right(Data.fromJson(right)),
    );
  }

  static Future<Either<Failure, bool>> checkout() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.checkout,
      headers: _authHeader,
    );
    return response.fold((l) => left(l), (right) => const Right(true));
  }
}
