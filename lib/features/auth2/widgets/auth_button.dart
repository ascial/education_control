import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const AuthButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: Colors.black,
        textColor: Colors.white,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
