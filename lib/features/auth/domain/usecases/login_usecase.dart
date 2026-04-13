import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/data.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);

  Future<Either<Failure, Data>> call(RegisterParams params) async {
    return await authRepo.login(params);
  }
}
