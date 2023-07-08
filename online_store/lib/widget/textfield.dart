import 'package:flutter/material.dart';

import 'colors.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput(
      {super.key,
      required this.controller,
      required this.hint,
      required this.textType,
      required this.isPass,
      required this.label});
  final TextEditingController controller;
  final String hint;
  final TextInputType textType;
  final bool isPass;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: primaryColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor)),
          labelText: label),
      keyboardType: textType,
      obscureText: isPass,
    );
  }
}
