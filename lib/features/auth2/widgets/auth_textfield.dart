import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.hint,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.zero,
          ),
          fillColor: Colors.grey[200],
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
      ),
    );
  }
}
