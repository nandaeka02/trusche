import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdminCitizenPage extends StatefulWidget {
  const AdminCitizenPage({super.key});

  @override
  State<AdminCitizenPage> createState() => _AdminCitizenPageState();
}

class _AdminCitizenPageState extends State<AdminCitizenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Citizen"),
      )
    );
  }
}