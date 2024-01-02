import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(String? text) {
    if (text == null) return;
    final messengerKey = GlobalKey<ScaffoldMessengerState>();
    final snackBar = SnackBar(content: Text(text));

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
