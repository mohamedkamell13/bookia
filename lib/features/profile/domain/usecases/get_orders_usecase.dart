import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/data/models/order_model.dart';
import 'package:bookia/features/profile/domain/repository/profile_repo.dart';
import 'package:dartz/dartz.dart';

class GetOrdersUseCase {
  final ProfileRepo repo;

  GetOrdersUseCase(this.repo);

  Future<Either<Failure, List<OrderModel>>> call() {
    return repo.getOrders();
  }
}
