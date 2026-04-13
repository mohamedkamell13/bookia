import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:bookia/features/profile/data/models/update_profile_params.dart';
import 'package:bookia/features/profile/domain/repository/profile_repo.dart';
import 'package:dartz/dartz.dart';

class EditProfileUseCase {
  final ProfileRepo repo;

  EditProfileUseCase(this.repo);

  Future<Either<Failure, User>> call(UpdateProfileParams params) {
    return repo.editProfile(params);
  }
}
