import 'package:edu_sys/features/auth/toggle_auth_screens.dart';
import 'package:edu_sys/features/auth/view/verify_email_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const VerifyEmailPage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
