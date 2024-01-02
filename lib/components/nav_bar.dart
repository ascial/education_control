import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            margin: const EdgeInsets.only(top: 0, bottom: 0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/books2.jpg"),
              ),
            ),
            child: ListView(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Профиль',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text(
              'Обучение',
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
