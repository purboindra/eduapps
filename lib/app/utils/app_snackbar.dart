import 'package:flutter/material.dart';

class AppSnakcbar {
  static void showSnackbar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
