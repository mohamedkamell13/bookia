import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:bookia/features/profile/data/models/order_model.dart';
import 'package:bookia/features/profile/data/models/profile_model.dart';
import 'package:bookia/features/profile/data/models/update_profile_params.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo {
  static Map<String, dynamic> get _authHeader => {
    'Authorization': 'Bearer ${SharedPref.getToken()}',
  };

  static Future<Either<Failure, ProfileModel>> getProfile() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.profile,
      headers: _authHeader,
    );
    return response.fold(
      (l) => left(l),
      (right) => Right(ProfileModel.fromJson(right)),
    );
  }

  static Future<Either<Failure, User>> editProfile(
    UpdateProfileParams params,
  ) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.updateProfile,
      data: params.toFormData(),
      headers: {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${SharedPref.getToken()}',
      },
    );
    return response.fold((l) => left(l), (right) {
      var user = User.fromJson(right);
      SharedPref.setUserInfo(user);
      return Right(user);
    });
  }

  static Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.updatePassword,
      headers: _authHeader,
      data: {
        'current_password': currentPassword,
        'password': newPassword,
        'password_confirmation': confirmPassword,
      },
    );
    return response.fold((l) => left(l), (right) => const Right(true));
  }

  static Future<Either<Failure, List<OrderModel>>> getOrders() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.orderHistory,
      headers: _authHeader,
    );
    return response.fold((l) => left(l), (right) {
      var list = (right as List<dynamic>)
          .map((e) => OrderModel.fromJson(e))
          .toList();
      return Right(list);
    });
  }
}
