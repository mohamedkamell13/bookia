import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/reset_password_params.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUseCase {
  final AuthRepo authRepo;
  ResetPasswordUseCase(this.authRepo);

  Future<Either<Failure, bool>> call(ResetPasswordParams params) async {
    return await authRepo.resetPassword(params);
  }
}
