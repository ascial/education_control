import 'package:edu_sys/features/auth2/widgets/auth_button.dart';
import 'package:edu_sys/features/auth2/widgets/auth_help_text.dart';
import 'package:edu_sys/features/auth2/widgets/auth_textfield.dart';
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
                AuthTextField(
                  hint: 'Почта',
                  obscureText: false,
                  controller: emailController,
                ),
                AuthTextField(
                  hint: 'Имя',
                  obscureText: false,
                  controller: firstNameController,
                ),
                AuthTextField(
                  hint: 'Фамилия',
                  obscureText: false,
                  controller: lastNameController,
                ),
                AuthTextField(
                  hint: 'Пароль',
                  obscureText: false,
                  controller: passwordController,
                ),
                AuthTextField(
                  hint: 'Подтвердите пароль',
                  obscureText: false,
                  controller: confirmPasswordController,
                ),
                AuthButton(onPressed: () {}, text: 'ЗАРЕГИСТРИРОВАТЬСЯ'),
                AuthHelpText(
                  text: 'Уже есть аккаунт?',
                  activeText: 'Войдите',
                  alignment: MainAxisAlignment.center,
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
