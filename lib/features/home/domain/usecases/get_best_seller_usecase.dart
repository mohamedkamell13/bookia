import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/models/best_seller_response/data.dart'
    as best_seller;
import 'package:bookia/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetBestSellerUseCase {
  final HomeRepo homeRepo;
  GetBestSellerUseCase(this.homeRepo);

  Future<Either<Failure, best_seller.Data>> call() async {
    return await homeRepo.getBestSeller();
  }
}
