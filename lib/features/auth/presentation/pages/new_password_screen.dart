import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/validators/app_validators.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:bookia/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewPasswordScreen extends StatelessWidget {
  final int verifyCode;
  const NewPasswordScreen({super.key, required this.verifyCode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AuthAppBar(),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              showLoadingDialog(context);
            } else if (state is AuthSuccessState) {
              pop(context);
              pushReplaceMent(context, Routes.passwordChanged);
            } else if (state is AuthErrorState) {
              pop(context);
              showMyDialog(context, 'Failed To Reset Password');
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Padding(
              padding: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create new password', style: TextStyles.headline),
                  Gap(10),
                  Text(
                    'Your new password must be unique from those previously used.',
                    style: TextStyles.body.copyWith(color: AppColors.greyColor),
                  ),
                  Gap(32),
                  PasswordTextFormField(
                    controller: cubit.newPasswordController,
                    hintText: 'New Password',
                    validator: AppValidators.password,
                  ),
                  Gap(15),
                  PasswordTextFormField(
                    controller: cubit.confirmNewPasswordController,
                    hintText: 'Confirm New Password',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please confirm your password';
                      } else if (input != cubit.newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  Gap(38),
                  MainButton(
                    text: 'Reset Password',
                    onPressed: () {
                      cubit.resetPassword(verifyCode);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
