import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';

class UserRiwayatPembayaran extends StatefulWidget {
  const UserRiwayatPembayaran({super.key});

  @override
  State<UserRiwayatPembayaran> createState() => _UserRiwayatPembayaranState();
}

class _UserRiwayatPembayaranState extends State<UserRiwayatPembayaran> {
  final _formKey = GlobalKey<FormState>();
  String? selectedBulan;
  String? selectedbank;
  String? selectedewallet;

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
        
        backgroundColor: ConstantColors.secondaryColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text(
                'Riwayat Pembayaran',
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
                  height: 450,
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
                          decoration: BoxDecoration(
                              color: ConstantColors.secondaryColor),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text("Juni 2023"),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text("Belum Bayar"),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text("Mei 2023"),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Belum Bayar"),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Colors.green,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text("April 2023"),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Berhasil"),
                                      )
                                    ],
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: ConstantColors.secondaryColor),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text("Juni 2023"),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text("Belum Bayar"),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Colors.green,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text("Mei 2023"),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Berhasil"),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Colors.green,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text("April 2023"),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Berhasil"),
                                      )
                                    ],
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ]))
            ],
          ),
        ));
  }
}
