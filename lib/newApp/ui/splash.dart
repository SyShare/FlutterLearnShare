import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_one/newApp/ui/login_screen.dart';

import '../util/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer counter;

  @override
  void initState() {
    super.initState();
    counter = Timer(const Duration(seconds: 5), () {
      changeScreen();
    });
  }

  changeScreen() async {
    MyRouter.pushPageReplacement(
      context,
      const LoginScreen(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    counter.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app-icon.png",
              height: 300.0,
              width: 300.0,
            )
          ],
        ),
      ),
    );
  }
}
