import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';

class UserPembayaran extends StatefulWidget {
  const UserPembayaran({super.key});

  @override
  State<UserPembayaran> createState() => _UserPembayaranState();
}

class _UserPembayaranState extends State<UserPembayaran> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  final _pageController = PageController(initialPage: 2);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          toolbarHeight: 25,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: ConstantColors.secondaryColor,
        body: Center(
          child: Column(
            children: [
              Text(
                'Pembayaran',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  // padding: const EdgeInsets.all(8.0),

                  width: double.infinity,
                  height: 400,
                  child: ContainedTabBarView(
                      tabs: [
                        Text(
                          "Kebersihan",
                        ),
                        Text(
                          "Keamanan",
                        ),
                      ],
                      tabBarProperties: TabBarProperties(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 00.0,
                          vertical: 8.0,
                        ),
                        background: Container(
                          height: 40,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: HexColor("#E8E8E8"),
                          ),
                        ),
                        indicator: ContainerTabIndicator(
                          radius: BorderRadius.circular(20),
                          color: Colors.white,
                          // borderWidth: 2.0,
                          borderColor: Colors.black,
                        ),
                        labelColor: HexColor("#3D8361"),
                        unselectedLabelColor: HexColor("#BDBDBD"),
                      ),
                      views: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(color: Colors.blue),
                        )
                      ]))
            ],
          ),
        ));
  }
}
