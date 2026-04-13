import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/verify_code_params.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class CheckForgetPasswordUseCase {
  final AuthRepo authRepo;
  CheckForgetPasswordUseCase(this.authRepo);

  Future<Either<Failure, bool>> call(VerifyCodeParams params) async {
    return await authRepo.checkForgetPassword(params);
  }
}
