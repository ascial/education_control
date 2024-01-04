import 'package:flutter/material.dart';

class NavBarListTile extends StatelessWidget {
  final String field;
  final Icon icon;
  final void Function() onTap;

  const NavBarListTile({
    super.key,
    required this.field,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        field,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }
}
