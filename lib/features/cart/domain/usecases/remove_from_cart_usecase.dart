import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/data.dart';
import 'package:bookia/features/cart/domain/repository/cart_repo.dart';
import 'package:dartz/dartz.dart';

class RemoveFromCartUseCase {
  final CartRepo cartRepo;
  RemoveFromCartUseCase(this.cartRepo);

  Future<Either<Failure, Data>> call(int cartItemId) async {
    return await cartRepo.removeFromCart(cartItemId);
  }
}
