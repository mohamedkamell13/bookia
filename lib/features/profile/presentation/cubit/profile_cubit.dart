import 'package:bookia/features/profile/data/models/order_model.dart';
import 'package:bookia/features/profile/data/models/profile_model.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  ProfileModel? profile;
  List<OrderModel> orders = [];

  Future<void> getProfile({bool forceRefresh = false}) async {
    if (profile != null && !forceRefresh) return;
    emit(GetProfileLoadingState());
    try {
      profile = await ProfileRepo.getProfile();
      emit(GetProfileSuccessState());
    } catch (e) {
      emit(GetProfileErrorState(e.toString()));
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ChangePasswordLoadingState());
    try {
      await ProfileRepo.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      emit(ChangePasswordSuccessState());
    } catch (e) {
      emit(ChangePasswordErrorState(e.toString()));
    }
  }

  Future<void> getOrders() async {
    emit(GetOrdersLoadingState());
    try {
      orders = await ProfileRepo.getOrders();
      emit(GetOrdersSuccessState());
    } catch (e) {
      emit(GetOrdersErrorState(e.toString()));
    }
  }

  void clearProfile() {
    profile = null;
  }
}
