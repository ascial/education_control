import 'dart:async';
import 'package:edu_sys/features/profile/view/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();

    setState(() => canResendEmail = false);
    await Future.delayed(const Duration(minutes: 1));
    setState(() => canResendEmail = true);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomePage()
      : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange[700],
            foregroundColor: Colors.white,
            title: const Text('Подтвердите почту'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Письмо с ссылкой для подтверждения было отправлено на вашу почту',
                  style: TextStyle(fontSize: 19),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      foregroundColor: Colors.white,
                      shadowColor: Colors.white,
                      backgroundColor: Colors.deepOrange,
                      fixedSize: const Size(245, 40)),
                  icon: const Icon(Icons.email, size: 23),
                  label: const Text(
                    'Отправить ещё раз',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
                  ),
                  onPressed: () {
                    if (canResendEmail == true) {
                      sendVerificationEmail();
                    }
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size(245, 30),
                    backgroundColor: Colors.grey[200],
                  ),
                  child: const Text(
                    'Отмена',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                )
              ],
            ),
          ),
        );
}
