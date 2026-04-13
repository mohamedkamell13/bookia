import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/validators/app_validators.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:bookia/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewPasswordScreen extends StatelessWidget {
  final int verifyCode;
  const NewPasswordScreen({super.key, required this.verifyCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            showMyDialog(context, 'failedResetPassword'.tr());
          }
        },
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();
          return Padding(
            padding: EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('newpassword'.tr(), style: TextStyles.headline),
                Gap(10),
                Text(
                  'newpasswordmsg'.tr(),
                  style: TextStyles.body.copyWith(color: AppColors.greyColor),
                ),
                Gap(32),
                PasswordTextFormField(
                  controller: cubit.newPasswordController,
                  hintText: 'newpassword'.tr(),
                  validator: AppValidators.password,
                ),
                Gap(15),
                PasswordTextFormField(
                  controller: cubit.confirmNewPasswordController,
                  hintText: 'confirmNewPassword'.tr(),
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'validConfirmPassword'.tr();
                    } else if (input != cubit.newPasswordController.text) {
                      return 'validPasswordMatch'.tr();
                    }
                    return null;
                  },
                ),
                Gap(38),
                MainButton(
                  text: 'resetPassword2'.tr(),
                  onPressed: () {
                    cubit.resetPassword(verifyCode);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
