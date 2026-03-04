import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/body_view.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/pages/login_screen.dart';
import 'package:bookia/features/auth/widgets/email_text_form_field.dart';
import 'package:bookia/features/auth/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/widgets/text_rich.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userNameController = TextEditingController();
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
                'Hello! Register to get started',
                style: TextStyles.headline,
              ),
              Gap(32),
              CustomTextFormField(
                controller: userNameController,
                hintText: 'Username',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'please enter your User name';
                  }
                  return null;
                },
              ),
              Gap(11),
              EmailTextFormField(
                emailController: emailController,
                hintText: 'Email',
              ),
              Gap(13),
              PasswordTextFormField(
                controller: passwordController,
                hintText: 'Password',
              ),
              Gap(12),
              PasswordTextFormField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
              ),
              Gap(30),
              MainButton(text: 'Register', onPressed: () {}),
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
              textSpan: 'Already have an account?',
              textButton: "Login Now",
              onpressed: () {
                pushTo(context, LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
