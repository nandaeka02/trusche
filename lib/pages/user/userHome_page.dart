import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';
import 'package:trusche/pages/user/model/UserDetail.dart';
import 'package:trusche/pages/user/userChatRoom_page.dart';
import 'package:trusche/pages/user/userJadwalKeamanan.dart';
import 'package:trusche/pages/user/userJadwalKebersihan.dart';
import 'package:trusche/pages/user/userNotification.dart';
import 'package:trusche/pages/user/userProfile.dart';
import 'package:trusche/pages/user/viewModel/getUserVmodel.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../widgets/schedulecard_widget.dart';

class UserHomepage extends StatefulWidget {
  const UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  final _formKey = GlobalKey<FormState>();
  Userdetail? userdetail;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController keluhan = TextEditingController();

  bool _obscureText = true;
  final _pageController = PageController(initialPage: 2);

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
        : Stack(
            // alignment: Alignment.center,
            children: [
              Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    toolbarHeight: 50,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfile()),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.brown.shade800,
                          child: const Text('user'),
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: IconTheme(
                          data: IconThemeData(size: 30),
                          child: IconButton(
                            icon: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                            tooltip: 'Go to the next page',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserNotification()),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  backgroundColor: ConstantColors.secondaryColor,
                  body: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                // color: HexColor("#609C56"),
                                image: DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/images/Background.png'),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 110, 0, 0),
                                      child: Text(
                                        'Halo, User!',
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          // SizedBox(height: 100,),
                          // Text("data")
                        ],
                      ),
                    ],
                  )),
              Positioned(
                  left: 2,
                  top: 150,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 45,
                            width: 320,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    UrlLauncher.launch('tel:+6291723231');
                                  },
                                  child: Container(
                                    width: 290,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ConstantColors.primaryColor),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              size: 30,
                                              Icons.call,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Panggilan Darurat",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 290,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                              child: Text("Kirim Pesan",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  height: 40,
                                  width: 300,
                                  child: TextFormField(
                                    controller: keluhan,
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      floatingLabelStyle:
                                          TextStyle(color: HexColor("#5E5E5E")),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      labelText: "Sampaikan Keluhanmu ",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 5,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 10,
                                  top: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (keluhan.text == "") {
                                        print("kosong");
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserChatRoomPage(
                                                    chat: keluhan.text,
                                                  )),
                                        );
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                      ),
                                      backgroundColor:
                                          ConstantColors.primaryColor,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 365,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Butuh Apa Hari ini ?",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                      child: Container(
                    height: 180,
                    child: Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JadwalKebersihan()),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 315,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Column(children: [
                                  Image.asset(
                                    'assets/images/user1.png',
                                    scale: 4,
                                  ),
                                  Text("Jadwal Kebersihan")
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JadwalKeamanan()),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 315,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Column(children: [
                                  Image.asset(
                                    'assets/images/user2.png',
                                    scale: 4,
                                  ),
                                  Text("Jadwal Keamanan")
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ]),
                    )),
                  ))
                ],
              )
            ],
          );
  }
}
