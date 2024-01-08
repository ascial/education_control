import 'package:flutter/material.dart';

class AuthActiveText extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const AuthActiveText({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
