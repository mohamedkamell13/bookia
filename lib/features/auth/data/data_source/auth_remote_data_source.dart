import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/data.dart';
import 'package:bookia/features/auth/data/models/forgot_password_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/reset_password_params.dart';
import 'package:bookia/features/auth/data/models/verify_code_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, Data>> register(RegisterParams params);
  Future<Either<Failure, Data>> login(RegisterParams params);
  Future<Either<Failure, bool>> forgotPassword(ForgotPasswordParams params);
  Future<Either<Failure, bool>> checkForgetPassword(VerifyCodeParams params);
  Future<Either<Failure, bool>> resetPassword(ResetPasswordParams params);
}
