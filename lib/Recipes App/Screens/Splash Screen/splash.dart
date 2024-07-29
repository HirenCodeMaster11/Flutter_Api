import 'dart:async';

import 'package:api/Recipes%20App/Screens/Home%20Screen/Home%20Screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
          () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.deepOrange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 320,
                width: 320,
                color: Colors.deepOrange,
                child: Image.asset('assets/images/splash.png',),
              ),
            ),
            Text(
              'GUSTERAU',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 49,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
