import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/domain/repository/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutUseCase {
  final CartRepo cartRepo;
  CheckoutUseCase(this.cartRepo);

  Future<Either<Failure, bool>> call() async {
    return await cartRepo.checkout();
  }
}
