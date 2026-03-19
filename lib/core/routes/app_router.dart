import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:bookia/features/auth/presentation/pages/login_screen.dart';
import 'package:bookia/features/auth/presentation/pages/new_password_screen.dart';
import 'package:bookia/features/auth/presentation/pages/otp_verfication_screen.dart';
import 'package:bookia/features/auth/presentation/pages/password_changed.dart';
import 'package:bookia/features/auth/presentation/pages/register_screen.dart';
import 'package:bookia/features/book_details/presentation/page/book_details_screen.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/intro/splash_screen.dart';
import 'package:bookia/features/intro/welcome_screen.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.otpVerification,
        builder: (context, state) =>
            OtpVerficationScreen(email: state.extra as String),
      ),
      GoRoute(
        path: Routes.newPassword,
        builder: (context, state) =>
            NewPasswordScreen(verifyCode: state.extra as int),
      ),
      GoRoute(
        path: Routes.passwordChanged,
        builder: (context, state) => PasswordChangedScreen(),
      ),
      GoRoute(path: Routes.main, builder: (context, state) => MainAppScreen()),
      GoRoute(
        path: Routes.bookDetails,
        builder: (context, state) {
          return BookDetailsScreen(model: state.extra as Product);
        },
      ),
    ],
  );
}
