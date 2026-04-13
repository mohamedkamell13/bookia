import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/data.dart';
import 'package:bookia/features/cart/domain/repository/cart_repo.dart';
import 'package:dartz/dartz.dart';

class GetCartUseCase {
  final CartRepo cartRepo;
  GetCartUseCase(this.cartRepo);

  Future<Either<Failure, Data>> call() async {
    return await cartRepo.getCart();
  }
}
