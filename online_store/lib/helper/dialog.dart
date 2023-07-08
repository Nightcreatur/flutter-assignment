import 'package:flutter/material.dart';
import 'package:online_store/screens/cart_item_screen.dart';
import 'package:online_store/widget/colors.dart';

class Dialogs {
  static void showSnackBar(
      {required BuildContext context, required String msg, String? label}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        action: SnackBarAction(
          label: label!,
          textColor: darkP,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            );
          },
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
