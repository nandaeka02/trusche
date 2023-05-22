import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';
import 'package:trusche/pages/user/userJadwalKebersihan.dart';
import 'package:trusche/pages/user/userNotification.dart';
import 'package:trusche/pages/user/userProfile.dart';

import '../../widgets/schedulecard_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController email = TextEditingController();

  bool _obscureText = true;
  final _pageController = PageController(initialPage: 2);

  int maxCount = 5;

  /// widget list
  final List<Widget> bottomBarPages = [
    // const Page1(),
    // const Page2(),
    // const Page3(),
    // const Page4(),
    // const Page5(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 15, right: 10),
              child: Text("Ubah Profil"))
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: ConstantColors.primaryColor,
            height: 700,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: ConstantColors.secondaryColor,
              height: 440,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Text(
                "Lisa Adrina",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "NIK",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 50.0,
                width: 320,
                margin: const EdgeInsets.only(
                  bottom: 6.0,
                  top: 5,
                ), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.email),
                    ),
                    Text("l.lisadrina@gmail.com")
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: 320,
                margin: const EdgeInsets.only(
                  bottom: 6.0,
                  top: 5,
                ), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.call),
                    ),
                    Text("+6286373787433")
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: 320,
                margin: const EdgeInsets.only(
                  bottom: 6.0,
                  top: 5,
                ), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.location_on),
                    ),
                    Text("Jl. Pagelarang No. 56 Rt. 03/Rw. 06")
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: 320,
                margin: const EdgeInsets.only(
                  bottom: 6.0,
                  top: 5,
                ), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.settings),
                    ),
                    Text("Pengaturan")
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                    color: ConstantColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "Keluar",
                  style: TextStyle(color: Colors.white),
                )),
              )
            ],
          ),
          Positioned(
            top: 90,
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
