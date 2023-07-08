import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_store/screens/product_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimated = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
                duration: const Duration(seconds: 1),
                top: _isAnimated ? mq.height * .15 : -mq.height * .5,
                width: mq.width * .4,
                left: mq.width * .3,
                child: Image.asset('assets/images/shopping-online.png')),
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: mq.height * .4,
              width: mq.width * .5,
              left: mq.width * .25,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: _isAnimated ? 1 : 0,
                child: const Text(
                  'Welcom to Online Store!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Positioned(
                bottom: mq.height * .15,
                width: mq.width * .5,
                height: mq.width * .09,
                left: mq.width * .25,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => ProductScreen()),
                      );
                    },
                    icon: Image.asset(
                      'assets/images/google.png',
                      height: mq.height * .03,
                    ),
                    label: RichText(
                        text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                          TextSpan(text: 'Sign In with '),
                          TextSpan(
                              text: 'Google',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])))),
          ],
        ),
      ),
    );
  }
}

class Dialogs {
  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  static void showProgressBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Center(child: const CircularProgressIndicator()));
  }
}
