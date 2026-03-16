import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:bookia/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              pushToBase(context, Routes.main);
            } else if (state is AuthErrorState) {
              pop(context);
              showErrorDialog(context, 'Failed To Login');
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Padding(
              padding: EdgeInsets.all(22),
              child: LoginForm(cubit: cubit),
            );
          },
        ),
        bottomNavigationBar: AuthFooter(
          textSpan: 'Don\'t have an account?',
          textButton: "Register Now",
          onPressed: () {
            pushReplaceMent(context, Routes.main);
          },
        ),
      ),
    );
  }
}
