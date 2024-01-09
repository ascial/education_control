import 'package:edu_sys/router/router.dart';
import 'package:flutter/material.dart';

class EducationApp extends StatelessWidget {
  const EducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: routes,
    );
  }
}