// splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Login.dart';
import 'package:flutter_application_4/Register.dart';
import 'package:flutter_application_4/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Navigate to the main content after a certain duration (e.g., 2 seconds)
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(162, 170, 123, 1),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: -50,
            left: -140,
            right: 194,
            child: Center(
                child: Text(
              'S',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x4DE0E3D3),
                fontSize: 708.62,
                fontFamily: 'Vibur',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )),
          ),
          Positioned(
            bottom: -200,
            left: 224.48,
            right: 0,
            child: Center(
                child: Text(
              'b',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x4DE0E3D3),
                fontSize: 708.62,
                fontFamily: 'Vibur',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Your app logo or splash screen image goes here
                // Replace the placeholder below with your actual image widget
                SizedBox(height: 400),
                Image.asset(
                  'assets/image/logo2.png',
                  width: 150,

                  // Adjust width and height as needed
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Reveal radiant skin by understanding its unique needs. Embrace a personalized skincare routine for a healthier, beautiful complexion',
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(34, 34, 34, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
