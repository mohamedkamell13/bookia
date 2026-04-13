import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/contact_us/domain/repository/contact_us_repo.dart';
import 'package:dartz/dartz.dart';

class SendMessageUseCase {
  final ContactUsRepo repo;

  SendMessageUseCase(this.repo);

  Future<Either<Failure, bool>> call({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) {
    return repo.sendMessage(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );
  }
}
