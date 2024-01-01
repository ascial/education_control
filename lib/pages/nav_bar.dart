import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.user});

  // Current user
  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            margin: const EdgeInsets.only(top: 0, bottom: 0),
            accountName: const Text(
              'Имя',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            accountEmail: Text(
              '${user.email}',
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey[800]!,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrange[700],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Личный кабинет',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text(
              'Мое обучение',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Настройки',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Выйти',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
