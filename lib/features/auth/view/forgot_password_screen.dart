import 'package:edu_sys/features/auth/widgets/auth_button.dart';
import 'package:edu_sys/features/auth/widgets/auth_text_field.dart';
import 'package:edu_sys/features/auth/widgets/auth_type_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, size: 100, color: Colors.black),
              const SizedBox(height: 100),
              const AuthTypeText(text: 'Восстановление пароля'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                    'Введите свою почту и мы отправим вам ссылку для восстановления пароля.'),
              ),
              AuthTextField(
                obscureText: false,
                controller: emailController,
              ),
              AuthButton(
                onPressed: () {},
                text: 'Отправить ссылку',
              )
            ],
          ),
        ),
      ),
    );
  }
}
