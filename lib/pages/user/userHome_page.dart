import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';

class UserHomepage extends StatefulWidget {
  const UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
          leading: Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                child: const Text('AH'),
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
                    color: Colors.black,
                  ),
                  tooltip: 'Go to the next page',
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
        backgroundColor: ConstantColors.secondaryColor,
        body: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(color: HexColor("#609C56")),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                        child: Text(
                          'Halo, User!',
                          style: TextStyle(
                              fontSize: 32,fontWeight: FontWeight.w500, color: Colors.white),

                        ),
                      ))
                ],
              ),
            ),
            Container(
              height: 180,
              width: 330,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text("nan ini gmn caranya biar bisa ditengah2 ijo ama krem dah")),
            )
          ],
        ));
  }
}
