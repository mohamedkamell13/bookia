import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/faq/data/models/faq_models.dart';
import 'package:bookia/features/faq/domain/repository/faq_repo.dart';
import 'package:dartz/dartz.dart';

class GetFaqsUseCase {
  final FaqRepo repo;

  GetFaqsUseCase(this.repo);

  Future<Either<Failure, List<FaqModel>>> call() {
    return repo.getFaqs();
  }
}
