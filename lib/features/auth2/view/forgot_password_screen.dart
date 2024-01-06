import 'package:edu_sys/features/auth2/widgets/auth_button.dart';
import 'package:edu_sys/features/auth2/widgets/auth_help_text.dart';
import 'package:edu_sys/features/auth2/widgets/auth_textfield.dart';
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 100, color: Colors.black),
            const SizedBox(height: 100),
            AuthHelpText(
              text: 'Введите адрес электронной почты',
              activeText: '',
              alignment: MainAxisAlignment.center,
              onTap: () {},
            ),
            AuthTextField(
              hint: 'Почта',
              obscureText: false,
              controller: emailController,
            ),
            AuthButton(
              onPressed: () {},
              text: 'ВОССТАНОВИТЬ',
            )
          ],
        ),
      ),
    );
  }
}
