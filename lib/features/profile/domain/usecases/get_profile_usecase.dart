import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/data/models/profile_model.dart';
import 'package:bookia/features/profile/domain/repository/profile_repo.dart';
import 'package:dartz/dartz.dart';

class GetProfileUseCase {
  final ProfileRepo repo;

  GetProfileUseCase(this.repo);

  Future<Either<Failure, ProfileModel>> call() {
    return repo.getProfile();
  }
}
