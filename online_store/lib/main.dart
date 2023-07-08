import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_store/firebase_options.dart';
import 'package:online_store/providers/auth.dart';
import 'package:online_store/providers/cart.dart';
import 'package:online_store/providers/order.dart';
import 'package:online_store/providers/products_provider.dart';
import 'package:online_store/screens/splash_screen.dart';
import 'package:online_store/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding();
  _initializeFirebas();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(create: (context) => Orders())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, secondary: Colors.white),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          routes: {
            ProductDetail.routeName: (context) => const ProductDetail(),
          }),
    );
  }
}

_initializeFirebas() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
