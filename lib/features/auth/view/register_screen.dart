import 'package:edu_sys/features/auth/widgets/auth_active_text.dart';
import 'package:edu_sys/features/auth/widgets/auth_button.dart';
import 'package:edu_sys/features/auth/widgets/auth_text_field.dart';
import 'package:edu_sys/features/auth/widgets/auth_type_text.dart';
import 'package:edu_sys/repositories/auth/auth_repository.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final authRepository = AuthRepository();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                const AuthTypeText(text: 'Регистрация'),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text('Почта'),
                    ],
                  ),
                ),
                AuthTextField(controller: emailController, obscureText: false),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text('Имя'),
                    ],
                  ),
                ),
                AuthTextField(
                    controller: firstNameController, obscureText: false),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text('Фамилия'),
                    ],
                  ),
                ),
                AuthTextField(
                    controller: lastNameController, obscureText: false),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text('Пароль'),
                    ],
                  ),
                ),
                AuthTextField(
                    controller: passwordController, obscureText: true),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text('Повторите пароль'),
                    ],
                  ),
                ),
                AuthTextField(
                    controller: confirmPasswordController, obscureText: true),
                AuthButton(
                  text: 'Зарегистрироваться',
                  onPressed: () {
                    authRepository
                        .signUp(
                          emailController.text.trim(),
                          firstNameController.text.trim(),
                          lastNameController.text.trim(),
                          passwordController.text.trim(),
                          confirmPasswordController.text.trim(),
                        )
                        .whenComplete(
                            () => Navigator.of(context).pushNamed('/profile'));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Уже зарегистрированы? '),
                      AuthActiveText(
                          text: 'Войдите',
                          onTap: () {
                            Navigator.of(context).pushNamed('/login');
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
