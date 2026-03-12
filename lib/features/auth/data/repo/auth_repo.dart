import 'dart:developer';
import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/models/forgot_password_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/reset_password_params.dart';
import 'package:bookia/features/auth/data/models/verify_code_params.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Future<AuthResponse?> register(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        data: params.toJson(),
        endPoint: Apis.register,
      );
      if (response.statusCode == 201) {
        response.data;
        var data = AuthResponse.fromJson(response.data);
        SharedPref.setToken(data.data?.token ?? '');
        SharedPref.setUserInfo(data.data?.user);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        data: params.toJson(),
        endPoint: Apis.login,
      );
      if (response.statusCode == 200) {
        response.data;
        var data = AuthResponse.fromJson(response.data);
        SharedPref.setToken(data.data?.token ?? '');
        SharedPref.setUserInfo(data.data?.user);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> forgotPassword(ForgotPasswordParams params) async {
    try {
      var response = await DioProvider.post(
        data: params.toJson(),
        endPoint: Apis.forgotPassword,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> checkForgetPassword(VerifyCodeParams params) async {
    try {
      var response = await DioProvider.post(
        data: params.toJson(),
        endPoint: Apis.checkForgetPassword,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> resetPassword(ResetPasswordParams params) async {
    try {
      var response = await DioProvider.post(
        data: params.toJson(),
        endPoint: Apis.resetPassword,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      log(e.response?.data);
      return false;
    }
  }
}
