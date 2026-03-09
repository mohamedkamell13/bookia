import 'package:bookia/core/services/validators/app_validators.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/widgets/email_text_form_field.dart';
import 'package:bookia/features/auth/presentation/widgets/forgot_password_button.dart';
import 'package:bookia/features/auth/presentation/widgets/login_social_buttons.dart';
import 'package:bookia/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.cubit});

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Welcome back! Glad to see you, Again!',
              style: TextStyles.headline,
            ),
            Gap(32),
            EmailTextFormField(
              emailController: cubit.emailController,
              hintText: 'Enter your email',
              validator: AppValidators.email,
            ),
            Gap(15),
            PasswordTextFormField(
              controller: cubit.passwordController,
              hintText: 'Enter your password',
              validator: AppValidators.password,
            ),
            Gap(13),
            ForgotPasswordButton(),
            Gap(30),
            MainButton(
              text: 'Login',
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.login();
                }
              },
            ),
            Gap(34),
            LoginSocialButtons(),
            Gap(92),
          ],
        ),
      ),
    );
  }
}
