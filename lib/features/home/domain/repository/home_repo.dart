import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/models/best_seller_response/data.dart'
    as best_seller;
import 'package:bookia/features/home/data/models/slider_response/data.dart'
    as slider;
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, slider.Data>> getSlider();
  Future<Either<Failure, best_seller.Data>> getBestSeller();
}
