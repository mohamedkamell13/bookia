import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/forgot_password_params.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase {
  final AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);

  Future<Either<Failure, bool>> call(ForgotPasswordParams params) async {
    return await authRepo.forgotPassword(params);
  }
}
