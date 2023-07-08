import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackBar(BuildContext context, String msg, String lable) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 500),
        action: SnackBarAction(
          label: lable,
          onPressed: () {},
        ),
        content: Text(msg),
      ),
    );
  }

  static void showProgressBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Center(child: CircularProgressIndicator()));
  }
}
