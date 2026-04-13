import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/models/governrate.dart';
import 'package:dartz/dartz.dart';

abstract class PlaceOrderRepo {
  Future<Either<Failure, List<Governorate>>> getGovernorates();
}
