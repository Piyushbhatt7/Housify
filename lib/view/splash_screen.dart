
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          
          gradient: LinearGradient(
            colors: [
            Colors.pinkAccent,
            Colors.amberAccent,
          ],
             begin: FractionalOffset(0, 0),
             end: FractionalOffset(1, 0)
          )
        ),
      ),
    );
  }
}