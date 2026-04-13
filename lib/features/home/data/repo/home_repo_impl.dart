import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/features/home/data/models/best_seller_response/data.dart'
    as best_seller;
import 'package:bookia/features/home/data/models/slider_response/data.dart'
    as slider;
import 'package:bookia/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, slider.Data>> getSlider() async {
    return await homeRemoteDataSource.getSlider();
  }

  @override
  Future<Either<Failure, best_seller.Data>> getBestSeller() async {
    return await homeRemoteDataSource.getBestSeller();
  }
}
