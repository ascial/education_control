import 'package:edu_sys/features/auth2/widgets/auth_active_text.dart';
import 'package:edu_sys/features/auth2/widgets/auth_button.dart';
import 'package:edu_sys/features/auth2/widgets/auth_type_text.dart';
import 'package:edu_sys/features/auth2/widgets/auth_text_field.dart';
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
              const AuthTypeText(text: 'Вход'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text('Почта'),
                  ],
                ),
              ),
              AuthTextField(controller: emailController, obscureText: false),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text('Пароль'),
                    const Spacer(),
                    AuthActiveText(
                        text: 'Забыли пароль?',
                        onTap: () {
                          Navigator.of(context).pushNamed('/forgot_password');
                        }),
                  ],
                ),
              ),
              AuthTextField(controller: passwordController, obscureText: true),
              AuthButton(onPressed: () {}, text: 'Войти'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Нет аккаунта? '),
                    AuthActiveText(text: 'Зарегистрироваться', onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
