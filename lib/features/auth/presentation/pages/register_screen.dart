import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/validators/app_validators.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:bookia/features/auth/presentation/widgets/email_text_form_field.dart';
import 'package:bookia/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(),
      body: _registerBody(context),
      bottomNavigationBar: AuthFooter(
        textSpan: 'Already have an account?',
        textButton: "Login Now",
        onPressed: () {
          pushTo(context, Routes.login);
        },
      ),
    );
  }

  Widget _registerBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pushToBase(context, Routes.login);
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, 'Failed To Register');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(22),
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Hello! Register to get started',
                    style: TextStyles.headline,
                  ),
                  Gap(32),
                  CustomTextFormField(
                    controller: cubit.userNameController,
                    hintText: 'Username',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: AppValidators.username,
                  ),
                  Gap(11),
                  EmailTextFormField(
                    emailController: cubit.emailController,
                    hintText: 'Email',
                    validator: AppValidators.email,
                  ),
                  Gap(13),
                  PasswordTextFormField(
                    controller: cubit.passwordController,
                    hintText: 'Password',
                    validator: AppValidators.password,
                  ),
                  Gap(12),
                  PasswordTextFormField(
                    controller: cubit.confirmPasswordController,
                    hintText: 'Confirm Password',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please confirm your password';
                      } else if (input != cubit.passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  Gap(30),
                  if (state is AuthLoadingState) ...{
                    CircularProgressIndicator(),
                  } else ...{
                    MainButton(
                      text: 'Register',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.register();
                        }
                      },
                    ),
                  },
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
