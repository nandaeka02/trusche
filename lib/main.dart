import 'package:flutter/material.dart';
import 'package:trusche/pages/admin/adminBottomBar_page.dart';
import 'package:trusche/pages/login_page.dart';
import 'package:trusche/pages/splash_page.dart';
import 'package:trusche/pages/user/userHome_page.dart';
import 'package:trusche/pages/user/userbotBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traschu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
