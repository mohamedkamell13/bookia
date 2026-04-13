import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/models/auth_response/data.dart';
import 'package:bookia/features/auth/data/models/forgot_password_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/reset_password_params.dart';
import 'package:bookia/features/auth/data/models/verify_code_params.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, Data>> register(RegisterParams params) async {
    return await authRemoteDataSource.register(params);
  }

  @override
  Future<Either<Failure, Data>> login(RegisterParams params) async {
    return await authRemoteDataSource.login(params);
  }

  @override
  Future<Either<Failure, bool>> forgotPassword(
    ForgotPasswordParams params,
  ) async {
    return await authRemoteDataSource.forgotPassword(params);
  }

  @override
  Future<Either<Failure, bool>> checkForgetPassword(
    VerifyCodeParams params,
  ) async {
    return await authRemoteDataSource.checkForgetPassword(params);
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
    ResetPasswordParams params,
  ) async {
    return await authRemoteDataSource.resetPassword(params);
  }
}
