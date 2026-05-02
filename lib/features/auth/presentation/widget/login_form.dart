import 'package:flutter/material.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widget/input.dart';

class LoginForm extends StatefulWidget {
  final bool isMock;

  const LoginForm({super.key, this.isMock = false});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  String? emailErrorText;
  String? passwordErrorText;
  bool emailError = false;
  bool passwordError = false;


  @override
  void initState() {
    super.initState();

    emailController = TextEditingController(
      text: widget.isMock ? "test@email.com" : "",
    );

    passwordController = TextEditingController(
      text: widget.isMock ? "123456" : "",
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validate() {
    final emailError = Validators.email(emailController.text);
    final passwordError = Validators.password(passwordController.text);

    setState(() {
      this.emailError = emailError != null;
      this.passwordError = passwordError != null;

       emailErrorText = emailError;
      passwordErrorText = passwordError;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInputField(
          controller: emailController,
          hintText: "Email",
          isError: emailError,
          errorText: emailErrorText,
        ),

        const SizedBox(height: 16),

        AppInputField(
          controller: passwordController,
          hintText: "Password",
          obscureText: true,
          isError: passwordError,
          errorText: passwordErrorText,
        ),

        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: validate,
            child: const Text("Login"),
          ),
        ),
      ],
    );
  }
}