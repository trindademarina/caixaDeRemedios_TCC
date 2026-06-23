import 'dart:async';
import 'package:flutter/material.dart';

import 'pag_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const PagLogin(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [

              Image.asset(
                'assets/images/logo.png',
                width: 180,
              ),

              const SizedBox(height: 24),

              const Text(
                'CareBox',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF008C95),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Automated Medicine Manager',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}