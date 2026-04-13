import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/domain/repository/profile_repo.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final ProfileRepo repo;

  ChangePasswordUseCase(this.repo);

  Future<Either<Failure, bool>> call({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    return repo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }
}
