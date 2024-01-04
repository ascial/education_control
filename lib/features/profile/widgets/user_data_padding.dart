import 'package:flutter/material.dart';

class UserDataPadding extends StatelessWidget {
  final String fieldName;

  const UserDataPadding({super.key, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(
        fieldName,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
