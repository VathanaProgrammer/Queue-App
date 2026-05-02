import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/constant/text_styles.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionsBuilder: (_, animation, __, child) {
            const begin = Offset(1.0, 0.0); // from right → left
            const end = Offset.zero;

            final tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: Curves.easeInOut));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'VenQueue',
          style: AppTextStyles.splashtitle,

        ),
      ),
    );
  }
}