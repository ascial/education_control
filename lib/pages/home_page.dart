import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_sys/components/text_box.dart';
import 'nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Current user
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(user: user),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[700],
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Личный кабинет',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),

          // Profile picture
          const Icon(
            Icons.person,
            size: 80,
          ),
          const SizedBox(height: 10),

          // User email
          Text(
            user.email!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 50),

          // User details
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Мои данные',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),

          // Username
          const MyTextBox(
            text: 'temsolv',
            sectionName: 'ID',
          ),
        ],
      ),
    );
  }
}
