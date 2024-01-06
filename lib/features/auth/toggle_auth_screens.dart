import 'package:edu_sys/features/auth/view/register_screen.dart';
import 'package:edu_sys/features/auth2/view/login_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const LoginScreen();
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
