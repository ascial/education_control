import 'package:edu_sys/features/common/navbar/widgets/navbar_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavBarDrawer extends StatelessWidget {
  const NavBarDrawer({super.key});

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
          NavBarListTile(
            field: 'Профиль',
            icon: const Icon(Icons.account_box),
            onTap: () {},
          ),
          NavBarListTile(
            field: 'Обучение',
            icon: const Icon(Icons.school),
            onTap: () {},
          ),
          NavBarListTile(
            field: 'Настройки',
            icon: const Icon(Icons.settings),
            onTap: () {},
          ),
          const Divider(height: 1),
          NavBarListTile(
            field: 'Выйти',
            icon: const Icon(Icons.logout),
            onTap: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    );
  }
}
