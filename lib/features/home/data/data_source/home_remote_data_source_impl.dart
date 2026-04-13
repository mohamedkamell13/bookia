import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/features/home/data/models/best_seller_response/data.dart'
    as best_seller;
import 'package:bookia/features/home/data/models/slider_response/data.dart'
    as slider;
import 'package:dartz/dartz.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Either<Failure, slider.Data>> getSlider() async {
    var response = await DioProvider.getApi(endPoint: Apis.sliders);
    return response.fold(
      (l) => left(l),
      (right) => Right(slider.Data.fromJson(right)),
    );
  }

  @override
  Future<Either<Failure, best_seller.Data>> getBestSeller() async {
    var response = await DioProvider.getApi(endPoint: Apis.bestSellers);
    return response.fold(
      (l) => left(l),
      (right) => Right(best_seller.Data.fromJson(right)),
    );
  }
}
