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
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:bookia/features/auth/presentation/widgets/email_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              pushTo(
                context,
                Routes.otpVerification,
                extra: context.read<AuthCubit>().forgotPasswordController.text,
              );
            } else if (state is AuthErrorState) {
              pop(context);
              showMyDialog(context, 'Failed To Send Code');
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Padding(
              padding: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forgot Password', style: TextStyles.headline),
                  Gap(10),
                  Text(
                    'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                    style: TextStyles.body.copyWith(color: AppColors.greyColor),
                  ),
                  Gap(30),
                  EmailTextFormField(
                    emailController: cubit.forgotPasswordController,
                    hintText: 'Enter your email',
                    validator: AppValidators.email,
                  ),
                  Gap(38),
                  MainButton(
                    text: 'Send Code',
                    onPressed: () {
                      cubit.forgotPassword();
                    },
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: AuthFooter(
          textSpan: 'Remember Password?',
          textButton: "Login",
          onPressed: () {
            pushReplaceMent(context, Routes.login);
          },
        ),
      ),
    );
  }
}
