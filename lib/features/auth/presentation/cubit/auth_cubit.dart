import 'package:bookia/features/auth/data/models/forgot_password_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/reset_password_params.dart';
import 'package:bookia/features/auth/data/models/verify_code_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.login(
      RegisterParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.fold(
      (l) => emit(AuthErrorState(messege: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.register(
      RegisterParams(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        name: userNameController.text,
      ),
    );
    response.fold(
      (l) => emit(AuthErrorState(messege: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> forgotPassword() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.forgotPassword(
      ForgotPasswordParams(email: forgotPasswordController.text),
    );
    response.fold(
      (l) => emit(AuthErrorState(messege: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> checkForgetPassword({required String email}) async {
    emit(AuthLoadingState());
    var response = await AuthRepo.checkForgetPassword(
      VerifyCodeParams(
        email: email,
        verifyCode: int.tryParse(otpController.text),
      ),
    );
    response.fold(
      (l) => emit(AuthErrorState(messege: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> resetPassword(int verifyCode) async {
    emit(AuthLoadingState());
    var response = await AuthRepo.resetPassword(
      ResetPasswordParams(
        verifyCode: verifyCode,
        newPassword: newPasswordController.text,
        newPasswordConfirmation: confirmNewPasswordController.text,
      ),
    );
    response.fold(
      (l) => emit(AuthErrorState(messege: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }
}
