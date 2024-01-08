import 'package:flutter/material.dart';

class AuthTypeText extends StatelessWidget {
  final String text;
  const AuthTypeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
