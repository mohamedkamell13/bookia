import 'package:bookia/app/app_core.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:flutter/material.dart';

void main() {
  DioProvider.init();
  runApp(const AppCore());
}
