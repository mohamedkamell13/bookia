import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/body_view.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/pages/register_screen.dart';
import 'package:bookia/features/auth/widgets/email_text_form_field.dart';
import 'package:bookia/features/auth/widgets/login_social_buttons.dart';
import 'package:bookia/features/auth/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/widgets/text_rich.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => pop(context),
          child: CustomSvgPicture(path: AppImages.back),
        ),
      ),
      body: BodyView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you, Again!',
                style: TextStyles.headline,
              ),
              Gap(32),
              EmailTextFormField(
                emailController: emailController,
                hintText: 'Enter your email',
              ),
              Gap(15),
              PasswordTextFormField(
                controller: passwordController,
                hintText: 'Enter your password',
              ),
              Gap(13),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      pushTo(context, RegisterScreen());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(30),
              MainButton(text: 'Login', onPressed: () {}),
              Gap(34),
              LoginSocialButtons(),
              Gap(92),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextRich(
              textSpan: 'Don\'t have an account?',
              textButton: "Register Now",
              onpressed: () {
                pushTo(context, RegisterScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
