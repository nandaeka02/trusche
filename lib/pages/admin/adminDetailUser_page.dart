import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';

class AdminDetailUserPage extends StatelessWidget {
  // const AdminDetailUserPage({super.key});
  final String name;

  const AdminDetailUserPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Detail Data Warga",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: ConstantColors.secondaryColor,
        body: Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 65,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  foregroundImage: Image.asset(
                    'assets/images/avataaars.png',
                  ).image,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text("Email",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text("$name@gmail.com"),
              const SizedBox(
                height: 24,
              ),
              Text("NIK",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text("3603286896730001"),
              const SizedBox(
                height: 24,
              ),
              Text("No. Telp",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text("081289579737"),
              const SizedBox(
                height: 24,
              ),
              Text("Alamat",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text("Bojong Gede Blok TD 6 No 5A RT 002 RW 012"),
            ],
          ),
        ));
  }
}
