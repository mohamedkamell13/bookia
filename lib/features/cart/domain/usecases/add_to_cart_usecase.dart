import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/data.dart';
import 'package:bookia/features/cart/domain/repository/cart_repo.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase {
  final CartRepo cartRepo;
  AddToCartUseCase(this.cartRepo);

  Future<Either<Failure, Data>> call(int productId) async {
    return await cartRepo.addToCart(productId);
  }
}
