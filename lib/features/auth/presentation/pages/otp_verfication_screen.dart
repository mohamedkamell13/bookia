import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_pinput.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class OtpVerficationScreen extends StatelessWidget {
  final String email;
  const OtpVerficationScreen({super.key, required this.email});

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
                Routes.newPassword,
                extra: int.tryParse(
                  context.read<AuthCubit>().otpController.text,
                ),
              );
            } else if (state is AuthErrorState) {
              pop(context);
              showMyDialog(context, 'Invalid Code');
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Padding(
              padding: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('OTP Verfication', style: TextStyles.headline),
                  Gap(10),
                  Text(
                    'Enter the verification code we just sent on your email address.',
                    style: TextStyles.body.copyWith(color: AppColors.greyColor),
                  ),
                  Gap(35),
                  CustomPinput(controller: cubit.otpController),
                  Gap(35),
                  MainButton(
                    text: 'Verify',
                    onPressed: () {
                      cubit.checkForgetPassword(email: email);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: AuthFooter(
          textSpan: 'Didn\'t recieved code?',
          textButton: "Resend",
          onPressed: () {
            pushReplaceMent(context, Routes.forgotPassword);
          },
        ),
      ),
    );
  }
}
