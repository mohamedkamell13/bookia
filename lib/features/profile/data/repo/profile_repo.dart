import 'dart:developer';

import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';

import 'package:bookia/features/profile/data/models/order_model.dart';
import 'package:bookia/features/profile/data/models/profile_model.dart';
import 'package:bookia/features/profile/data/models/update_profile_params.dart';
import 'package:bookia/features/profile/data/models/update_profile_response/update_profile_response.dart';

class ProfileRepo {
  static Future<ProfileModel> getProfile() async {
    final token = SharedPref.getToken();
    final response = await DioProvider.get(
      endPoint: Apis.profile,
      headers: {'Authorization': 'Bearer $token'},
    );
    return ProfileModel.fromJson(response.data['data']);
  }

  static Future<UpdateProfileResponse?> editProfile(
    UpdateProfileParams params,
  ) async {
    try {
      var response = await DioProvider.post(
        endPoint: Apis.updateProfile,
        data: params.toFormData(),
        headers: {
          'Content-Type': 'multipart/form-data',
          "authorization": "Bearer ${SharedPref.getToken()}",
        },
      );

      if (response.statusCode == 200) {
        var data = UpdateProfileResponse.fromJson(response.data);
        SharedPref.setUserInfo(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
  // static Future<void> updateProfile({
  //   required String name,
  //   required String phone,
  //   required String address,
  // }) async {
  //   final token = SharedPref.getToken();
  //   await DioProvider.post(
  //     endPoint: Apis.updateProfile,
  //     headers: {'Authorization': 'Bearer $token'},
  //     data: {'name': name, 'phone': phone, 'address': address},
  //   );
  // }

  static Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final token = SharedPref.getToken();
    await DioProvider.post(
      endPoint: Apis.updatePassword,
      headers: {'Authorization': 'Bearer $token'},
      data: {
        'current_password': currentPassword,
        'password': newPassword,
        'password_confirmation': confirmPassword,
      },
    );
  }

  static Future<List<OrderModel>> getOrders() async {
    final token = SharedPref.getToken();
    final response = await DioProvider.get(
      endPoint: Apis.orderHistory,
      headers: {'Authorization': 'Bearer $token'},
    );
    return (response.data['data'] as List)
        .map((e) => OrderModel.fromJson(e))
        .toList();
  }
}
