import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_store/screens/product_screen.dart';

import '../helper/dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimated = false;

  _handleGoogleButton() {
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) async {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const ProductScreen()));
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProductScreen()),
        );
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } catch (e) {
      Dialogs.showSnackBar(
        context: context,
        msg: 'Something went wrong,check internet',
      );
    }
    return null;

    // Once signed in, return the UserCredential
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
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
                bottom: mq.height * .5,
                child: Image.asset('assets/images/shopping-online.png')),
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: mq.height * .4,
              width: mq.width * .5,
              left: mq.width * .25,
              bottom: mq.height * .4,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: _isAnimated ? 1 : 0,
                child: const Text(
                  'Welcom to Online Store!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // Positioned(
            //   bottom: mq.height * .30,
            //   width: mq.width * .9,
            //   left: mq.width * .05,
            //   child: Form(
            //       key: _formKey,
            //       child: Column(
            //         children: [
            //           TextFieldInput(
            //               controller: _emailController,
            //               hint: 'Email',
            //               label: 'Email',
            //               textType: TextInputType.text,
            //               isPass: false),
            //           const SizedBox(
            //             height: 10,
            //           ),

            //           TextFieldInput(
            //               controller: _passwordController,
            //               hint: 'Password',
            //               label: 'Password',
            //               textType: TextInputType.text,
            //               isPass: true),

            //           // ElevatedButton(
            //           //     onPressed: () {}, child: const Text('SignUP'))
            //         ],
            //       )),
            // ),
            Positioned(
                bottom: mq.height * .15,
                width: mq.width * .5,
                height: mq.width * .09,
                left: mq.width * .25,
                child: ElevatedButton.icon(
                    onPressed: () {
                      _handleGoogleButton();
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
