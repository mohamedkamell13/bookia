import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/models/governrate.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderRepo {
  static Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    var response = await DioProvider.getApi(endPoint: Apis.governorates);
    return response.fold((l) => left(l), (right) {
      var list = (right as List<dynamic>)
          .map((e) => Governorate.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(list);
    });
  }
}
