import 'package:flutter/material.dart';

var globalContext = GlobalKey<NavigatorState>();

class Routes {
  static String splash = '/';
  static String welcome = '/welcome';
  static String login = '/login';
  static String register = '/register';
  static String forgotPassword = '/forgotPassword';
  static String otpVerification = '/otpVerfication';
  static String newPassword = '/newPassword';
  static String passwordChanged = '/passwordChanged';
  static String main = '/main';
  static String bookDetails = '/bookDetails';
  static String placeOrder = '/placeOrder';
  static String orderSuccess = '/orderSuccess';
  static String myOrders = '/my-orders';
  static String editProfile = '/edit-profile';
  static String changePassword = '/change-password';
  static String faq = '/faq';
  static String contactUs = '/contact-us';
}
