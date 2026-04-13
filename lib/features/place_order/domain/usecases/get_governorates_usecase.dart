import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/models/governrate.dart';
import 'package:bookia/features/place_order/domain/repository/place_order_repo.dart';
import 'package:dartz/dartz.dart';

class GetGovernoratesUseCase {
  final PlaceOrderRepo repo;

  GetGovernoratesUseCase(this.repo);

  Future<Either<Failure, List<Governorate>>> call() {
    return repo.getGovernorates();
  }
}
