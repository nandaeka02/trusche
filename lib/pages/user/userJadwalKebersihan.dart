import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';
import 'package:trusche/pages/user/userNotification.dart';

import '../../widgets/schedulecard_widget.dart';

class JadwalKebersihan extends StatefulWidget {
  const JadwalKebersihan({super.key});

  @override
  State<JadwalKebersihan> createState() => _JadwalKebersihanState();
}

class _JadwalKebersihanState extends State<JadwalKebersihan> {
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
                              "23 Maret",
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
                // SizedBox(height: 100,),
                // Text("data")
              ],
            ),
          ],
        ));
  }
}
