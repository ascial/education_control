import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_sys/features/profile/widgets/text_box.dart';
import '../../common/widgets/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  Future<void> editField(String field, String fieldName) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.white,
        shape: const BeveledRectangleBorder(),
        title: const Text('Введите новое значение'),
        content: TextField(
          style: const TextStyle(
            fontSize: 19,
          ),
          cursorColor: Colors.black,
          autofocus: true,
          decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              hintText: fieldName,
              hintStyle: const TextStyle(
                fontSize: 19,
              )),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: const Text('Отмена', style: TextStyle(color: Colors.black)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Сохранить',
                style: TextStyle(color: Colors.deepOrange)),
            onPressed: () => Navigator.of(context).pop(newValue),
          )
        ],
      ),
    );

    if (newValue.trim().length > 0) {
      await usersCollection.doc(currentUser.uid).update({
        field: newValue,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[700],
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Профиль',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const NavBar(),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser.uid!)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.person,
                  size: 125,
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Аккаунт',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                MyTextBox(
                  sectionName: 'ID',
                  text: userData['id'],
                  onPressed: () => editField('id', 'ID'),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Личные данные',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                MyTextBox(
                  sectionName: 'Имя',
                  text: userData['first_name'],
                  onPressed: () => editField('first_name', 'Имя'),
                ),
                MyTextBox(
                  sectionName: 'Фамилия',
                  text: userData['last_name'],
                  onPressed: () => editField('last_name', 'Фамилия'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Ошибка ${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
