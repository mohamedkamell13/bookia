import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/wishlist/data/models/wish_list_response/data.dart';
import 'package:dartz/dartz.dart';

class WishlistRepo {
  static Map<String, dynamic> get _authHeader => {
    "Authorization": "Bearer ${SharedPref.getToken()}",
  };

  static Future<Either<Failure, Data>> getWishlist() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.wishlist,
      queryParameters: {"page": 1},
      headers: _authHeader,
    );
    return response.fold(
      (l) => left(l),
      (right) => Right(Data.fromJson(right)),
    );
  }

  static Future<Either<Failure, Data>> addToWishlist(int productId) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.addToWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productId},
      headers: _authHeader,
    );
    return response.fold(
      (l) => left(l),
      (right) => Right(Data.fromJson(right)),
    );
  }

  static Future<Either<Failure, Data>> removeFromWishlist(int productId) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.removeFromWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productId},
      headers: _authHeader,
    );
    return response.fold(
      (l) => left(l),
      (right) => Right(Data.fromJson(right)),
    );
  }
}
