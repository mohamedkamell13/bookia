import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:bookia/features/profile/data/models/order_model.dart';
import 'package:bookia/features/profile/data/models/profile_model.dart';
import 'package:bookia/features/profile/data/models/update_profile_params.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<User> editProfile(UpdateProfileParams params);
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<List<OrderModel>> getOrders();
}
