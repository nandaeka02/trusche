import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    // Menjalankan timer selama 3 detik untuk berpindah ke halaman berikutnya
    Timer(Duration(seconds: 3), () {
      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.0, 1.1),
            colors: [
            ConstantColors.primaryColor,
            ConstantColors.primaryColor,
            ConstantColors.secondaryColor
          ])
          // color: ConstantColors.primaryColor,
          // image: DecorationImage(
          //   image: AssetImage('assets/images/Splash-Screen-Background.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Center(
          child: Stack(
            children: [
              
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png', 
                    width: 300.0,
                    height: 300.0,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}