import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_sys/features/common/appbar/appbar.dart';
import 'package:edu_sys/features/common/navbar/navbar.dart';
import 'package:edu_sys/features/profile/widgets/user_data_listview.dart';
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

    if (newValue.trim().isNotEmpty) {
      await usersCollection.doc(currentUser.uid).update({
        field: newValue,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Профиль'),
      drawer: const MyNavBar(),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return UserDataListView(
              userData: userData,
              editData: editField,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Что-то пошло не так: ${snapshot.error}'),
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
