import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/contact_us/data/data_source/contact_us_remote_data_source.dart';
import 'package:bookia/features/contact_us/domain/repository/contact_us_repo.dart';
import 'package:dartz/dartz.dart';

class ContactUsRepoImpl implements ContactUsRepo {
  final ContactUsRemoteDataSource remoteDataSource;

  ContactUsRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, bool>> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      var result = await remoteDataSource.sendMessage(
        name: name,
        email: email,
        subject: subject,
        message: message,
      );
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
