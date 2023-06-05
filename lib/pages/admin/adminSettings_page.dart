import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/login_page.dart';
import 'package:trusche/pages/register_page.dart';
import 'package:trusche/pages/user/userJadwalKebersihan.dart';
import 'package:trusche/pages/user/userNotification.dart';
import 'package:trusche/pages/user/userProfile.dart';
import 'package:trusche/pages/user/viewModel/getUserVmodel.dart';

import '../../widgets/schedulecard_widget.dart';
import '../user/model/UserDetail.dart';
import '../EditProfile.dart';

class AdminSettingsPage extends StatefulWidget {
  const AdminSettingsPage({super.key});

  @override
  State<AdminSettingsPage> createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController email = TextEditingController();

  bool _obscureText = true;
  final _pageController = PageController(initialPage: 2);
  Userdetail? userdetail;

  int maxCount = 5;

  /// widget list
  final List<Widget> bottomBarPages = [
    // const Page1(),
    // const Page2(),
    // const Page3(),
    // const Page4(),
    // const Page5(),
  ];

  void getUser() {
    getuserLogin().then((value) {
      setState(() {
        userdetail = value;
        // print(userdetail?.user.email);
      });
    });
  }

  void initState() {
    super.initState();
    getUser();
    // getDataLogin();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (userdetail == null)
        ? Center(
            child: Scaffold(
            backgroundColor: HexColor("#EEF2E6"),
            body: Center(
              child: CircularProgressIndicator(
                color: ConstantColors.primaryColor,
              ),
            ),
          ))
        : Scaffold(
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => editProfile()),
                    );
                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 15, right: 10),
                      child: Text("Ubah Profil")),
                )
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
                      userdetail!.user.fullName ?? "null",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userdetail!.user.nikUser ?? "null",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                          Text(userdetail!.user.email ?? "null")
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
                          Text(userdetail!.user.phoneNumber ?? "null")
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
                          Text(userdetail!.user.address ?? "null")
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => LoginPage()),
                        );
                      },
                      child: Container(
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
                      ),
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
