import 'package:flutter/material.dart';

class AuthHelpText extends StatelessWidget {
  final String text, activeText;
  final MainAxisAlignment alignment;
  final void Function() onTap;

  const AuthHelpText({
    super.key,
    required this.text,
    required this.activeText,
    required this.alignment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Text(
            '$text ',
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              activeText,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
