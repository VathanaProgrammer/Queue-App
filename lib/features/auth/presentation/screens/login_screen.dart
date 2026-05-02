import 'package:flutter/material.dart';

import '../widget/auth_tab_selector.dart';
import '../widget/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              AuthTabSelector(
                selectedIndex: selectedTab,
                onChanged: (index) {
                  setState(() {
                    selectedTab = index;
                  });
                },
              ),

              const SizedBox(height: 40),

              Expanded(
                child: selectedTab == 0
                    ? const LoginForm()
                    : const Center(child: Text("Sign Up")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}