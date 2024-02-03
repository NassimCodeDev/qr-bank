import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_bank/controllers/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'QR Bank',
          style: TextStyle(
              fontSize: 48.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
