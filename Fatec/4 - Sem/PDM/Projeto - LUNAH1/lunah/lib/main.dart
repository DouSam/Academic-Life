import 'package:flutter/material.dart';
import 'package:lunah/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LUNAH',
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
      },
    ),
  );
}