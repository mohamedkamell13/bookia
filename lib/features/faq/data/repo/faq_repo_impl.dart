import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/faq/data/data_source/faq_remote_data_source.dart';
import 'package:bookia/features/faq/data/models/faq_models.dart';
import 'package:bookia/features/faq/domain/repository/faq_repo.dart';
import 'package:dartz/dartz.dart';

class FaqRepoImpl implements FaqRepo {
  final FaqRemoteDataSource remoteDataSource;

  FaqRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<FaqModel>>> getFaqs() async {
    try {
      var result = await remoteDataSource.getFaqs();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
