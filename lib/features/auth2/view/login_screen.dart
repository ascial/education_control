import 'package:edu_sys/features/auth2/widgets/auth_help_text.dart';
import 'package:edu_sys/features/auth2/widgets/auth_button.dart';
import 'package:edu_sys/features/auth2/widgets/auth_textfield.dart';
import 'package:edu_sys/repositories/auth/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final authRepository = AuthRepository();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, size: 100, color: Colors.black),
              const SizedBox(height: 100),
              AuthTextField(
                hint: 'Почта',
                obscureText: false,
                controller: emailController,
              ),
              AuthTextField(
                hint: 'Пароль',
                obscureText: true,
                controller: passwordController,
              ),
              AuthHelpText(
                text: '',
                activeText: 'Забыли пароль?',
                alignment: MainAxisAlignment.end,
                onTap: () {
                  Navigator.of(context).pushNamed('/forgot_password');
                },
              ),
              AuthButton(
                text: 'ВОЙТИ',
                onPressed: () {
                  authRepository.signIn(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
              ),
              AuthHelpText(
                text: 'Нет аккаунта?',
                activeText: 'Зарегистрируйтесь',
                alignment: MainAxisAlignment.center,
                onTap: () {
                  Navigator.of(context).pushNamed('/register');
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
