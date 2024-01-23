import 'dart:async';

import 'package:carsilla/res/assets.dart';
import 'package:flutter/material.dart';

import '../intro.dart';

class SplahPage extends StatefulWidget {
  const SplahPage({super.key});

  @override
  State<SplahPage> createState() => _SplahPageState();
}

class _SplahPageState extends State<SplahPage> {
  @override
  void initState() {
    super.initState();
    delyaTimeF();
  }

  delyaTimeF() async {
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 2),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const IntroPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(IconAssets.logo),
      ),
    );
  }
}
