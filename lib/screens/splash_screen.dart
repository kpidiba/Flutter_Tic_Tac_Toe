import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/screens/game.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const GameScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryOne,
      body: Center(
        child: Text(
          "Tic-Tac-Toe Game",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 3,
              fontSize: 28,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
