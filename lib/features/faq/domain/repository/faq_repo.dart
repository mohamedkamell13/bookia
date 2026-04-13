import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/faq/data/models/faq_models.dart';
import 'package:dartz/dartz.dart';

abstract class FaqRepo {
  Future<Either<Failure, List<FaqModel>>> getFaqs();
}
