import 'package:flutter/material.dart';
import '../../../../routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign Up Screen (Mock)"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              child: const Text("Go to Login"),
            ),
          ],
        ),
      ),
    );
  }
}