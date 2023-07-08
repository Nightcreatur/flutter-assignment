import 'package:flutter/material.dart';

class CartBadge extends StatelessWidget {
  const CartBadge(
      {super.key, required this.child, required this.value, this.color});
  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color ?? Colors.orange),
                constraints: const BoxConstraints(minHeight: 16, minWidth: 16),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )))
      ],
    );
  }
}
