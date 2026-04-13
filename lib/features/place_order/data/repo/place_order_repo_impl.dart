import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/features/place_order/data/models/governrate.dart';
import 'package:bookia/features/place_order/domain/repository/place_order_repo.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderRepoImpl implements PlaceOrderRepo {
  final PlaceOrderRemoteDataSource remoteDataSource;

  PlaceOrderRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    try {
      var result = await remoteDataSource.getGovernorates();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
