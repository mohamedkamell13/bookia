import 'package:flutter/material.dart';

void pushReplaceMent(BuildContext context, Widget nextScreen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => nextScreen),
  );
}

void pushTo(BuildContext context, Widget nextScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
}

void pop(BuildContext context) {
  Navigator.pop(context);
}
