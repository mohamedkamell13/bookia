import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushReplaceMent(BuildContext context, String route, {Object? extra}) {
  context.pushReplacement(route, extra: extra);
}

void pushTo(BuildContext context, String route, {Object? extra}) {
  context.push(route, extra: extra);
}

void pushToBase(BuildContext context, String route, {Object? extra}) {
  context.go(route, extra: extra);
}

void pop(BuildContext context) {
  context.pop();
}
