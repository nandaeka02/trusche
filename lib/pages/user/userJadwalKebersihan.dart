import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';
import 'package:trusche/pages/user/userNotification.dart';
import 'package:intl/intl.dart';

import '../../widgets/schedulecard_widget.dart';

class JadwalKebersihan extends StatefulWidget {
  const JadwalKebersihan({super.key});

  @override
  State<JadwalKebersihan> createState() => _JadwalKebersihanState();
}

class _JadwalKebersihanState extends State<JadwalKebersihan> {
  final _formKey = GlobalKey<FormState>();
  String currentDate = DateFormat('d').format(DateTime.now());
  String currentMonth = DateFormat('MM').format(DateTime.now());

  late int hminsatu;
  late int hplussatu;
  late int hplusdua;

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

  void initState() {
    super.initState();
    hminsatu = int.parse(currentDate) - 1;
    hplussatu = int.parse(currentDate) + 1;
    hplusdua = int.parse(currentDate) + 2;
    // print(hminsatu);
    print(int.parse(currentMonth));
    // print(hplussatu);
    // print(hplusdua);

    // cekDatalengkap();
  }

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
        ),
        backgroundColor: ConstantColors.secondaryColor,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(color: HexColor("#609C56")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 80, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hari Ini",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Text(
                              currentDate + " Juni",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 25, 25, 0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          scale: 6,
                          opacity: const AlwaysStoppedAnimation(.2),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(hminsatu.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.grey)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        color: ConstantColors.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(currentDate,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(hplussatu.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.grey)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(hplusdua.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.grey)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Text("data"),
            Container(
                height: 300,
                width: 330,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.circle_rounded,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                          Text("Pagi"),
                          Spacer(),
                          Text("06:00 - 08:00")
                        ],
                      ),
                      Divider(thickness: 1),
                      Text("Nama Petugas : Tikno"),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.circle_rounded,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                          Text("Siang"),
                          Spacer(),
                          Text("11:00 - 13:00")
                        ],
                      ),
                      Divider(thickness: 1),
                      Text("Nama Petugas : Yanto"),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.circle_rounded,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                          Text("Malam"),
                          Spacer(),
                          Text("16:00 - 18:00")
                        ],
                      ),
                      Divider(thickness: 1),
                      Text("Nama Petugas : Edi"),
                    ],
                  ),
                ))
          ],
        ));
  }
}
