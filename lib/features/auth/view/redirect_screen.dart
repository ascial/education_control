import 'package:edu_sys/features/auth/view/login_screen.dart';
import 'package:edu_sys/features/profile/view/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const ProfileScreen();
              } else {
                return const LoginScreen();
              }
            }),
      );
}
