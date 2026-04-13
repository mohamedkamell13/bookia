import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/models/auth_response/data.dart';
import 'package:bookia/features/auth/data/models/forgot_password_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/reset_password_params.dart';
import 'package:bookia/features/auth/data/models/verify_code_params.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, Data>> register(RegisterParams params) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.register,
      data: params.toJson(),
    );
    return response.fold((l) => left(l), (right) {
      var data = Data.fromJson(right);
      SharedPref.setToken(data.token ?? '');
      SharedPref.setUserInfo(data.user);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Data>> login(RegisterParams params) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.login,
      data: params.toJson(),
    );
    return response.fold((l) => left(l), (right) {
      var data = Data.fromJson(right);
      SharedPref.setToken(data.token ?? '');
      SharedPref.setUserInfo(data.user);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, bool>> forgotPassword(
    ForgotPasswordParams params,
  ) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.forgotPassword,
      data: params.toJson(),
    );
    return response.fold((l) => left(l), (right) => const Right(true));
  }

  @override
  Future<Either<Failure, bool>> checkForgetPassword(
    VerifyCodeParams params,
  ) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.checkForgetPassword,
      data: params.toJson(),
    );
    return response.fold((l) => left(l), (right) => const Right(true));
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
    ResetPasswordParams params,
  ) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.resetPassword,
      data: params.toJson(),
    );
    return response.fold((l) => left(l), (right) => const Right(true));
  }
}
