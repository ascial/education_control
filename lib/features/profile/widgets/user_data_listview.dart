import 'package:edu_sys/features/profile/widgets/user_data_container.dart';
import 'package:edu_sys/features/profile/widgets/user_data_padding.dart';
import 'package:flutter/material.dart';

class UserDataListView extends StatelessWidget {
  final Map<String, dynamic> userData;

  final void Function(
    String,
    String,
  ) editData;

  const UserDataListView({
    super.key,
    required this.userData,
    required this.editData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 50),
        const Icon(
          Icons.person,
          size: 125,
        ),
        const SizedBox(height: 50),
        const UserDataPadding(fieldName: 'Аккаунт'),
        UserDataContainer(
          text: userData['username'],
          sectionName: 'Логин',
          onPressed: () => editData('username', 'ID'),
        ),
        const SizedBox(height: 25),
        const UserDataPadding(fieldName: 'Личные даные'),
        UserDataContainer(
          text: userData['first_name'],
          sectionName: 'Имя',
          onPressed: () => editData('first_name', 'Имя'),
        ),
        UserDataContainer(
          text: userData['last_name'],
          sectionName: 'Фамилия',
          onPressed: () => editData('last_name', 'Фамилия'),
        ),
      ],
    );
  }
}
