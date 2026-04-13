import 'package:bookia/features/profile/data/models/order_model.dart';
import 'package:bookia/features/profile/data/models/profile_model.dart';
import 'package:bookia/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/get_orders_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final GetOrdersUseCase getOrdersUseCase;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.changePasswordUseCase,
    required this.getOrdersUseCase,
  }) : super(ProfileInitial());

  ProfileModel? profile;
  List<OrderModel> orders = [];

  Future<void> getProfile({bool forceRefresh = false}) async {
    if (profile != null && !forceRefresh) return;
    emit(GetProfileLoadingState());
    var response = await getProfileUseCase();
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
    var response = await changePasswordUseCase(
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
    var response = await getOrdersUseCase();
    response.fold((l) => emit(GetOrdersErrorState(l.message)), (r) {
      orders = r;
      emit(GetOrdersSuccessState());
    });
  }

  void clearProfile() {
    profile = null;
  }
}
