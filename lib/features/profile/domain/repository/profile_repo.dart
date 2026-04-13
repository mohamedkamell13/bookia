import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:bookia/features/profile/data/models/order_model.dart';
import 'package:bookia/features/profile/data/models/profile_model.dart';
import 'package:bookia/features/profile/data/models/update_profile_params.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, User>> editProfile(UpdateProfileParams params);
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, List<OrderModel>>> getOrders();
}
