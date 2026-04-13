import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/models/slider_response/data.dart'
    as slider;
import 'package:bookia/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetSliderUseCase {
  final HomeRepo homeRepo;
  GetSliderUseCase(this.homeRepo);

  Future<Either<Failure, slider.Data>> call() async {
    return await homeRepo.getSlider();
  }
}
