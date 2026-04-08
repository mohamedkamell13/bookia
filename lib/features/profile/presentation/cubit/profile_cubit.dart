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
    var response = await ProfileRepo.getProfile();
    response.fold((l) => emit(GetProfileErrorState(l.message)), (r) {
      profile = r;
      emit(GetProfileSuccessState());
    });
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ChangePasswordLoadingState());
    var response = await ProfileRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    response.fold(
      (l) => emit(ChangePasswordErrorState(l.message)),
      (r) => emit(ChangePasswordSuccessState()),
    );
  }

  Future<void> getOrders() async {
    emit(GetOrdersLoadingState());
    var response = await ProfileRepo.getOrders();
    response.fold((l) => emit(GetOrdersErrorState(l.message)), (r) {
      orders = r;
      emit(GetOrdersSuccessState());
    });
  }

  void clearProfile() {
    profile = null;
  }
}
