import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.01,
            left: 0,
            right: -MediaQuery.of(context).size.width * 0.12,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(MediaQuery.of(context).size.height * 0.10),
              ),
              child: Container(
                color: Color(0xffc47726),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
          ),
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.01,
            left: -MediaQuery.of(context).size.width * 0.12,
            right: 0,
            child: Transform.rotate(
              angle: 3.14159,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                      MediaQuery.of(context).size.height * 0.10),
                ),
                child: Container(
                  color: Color(0xffc47726),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ECOMIFY',
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontSize: 72.0,
                    color: Color(0xff000000),
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
