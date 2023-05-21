import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({super.key});

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  final _formKey = GlobalKey<FormState>();
  final List<String> bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];
  final List<String> bank = ['BCA', 'BNI', 'Mandiri', 'BRI', 'BSI'];
  final List<String> ewallet = ['Dana', 'OVO', 'Link Aja'];
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          ),
        ),
        backgroundColor: ConstantColors.secondaryColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Text(
                'Notifikasi',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ConstantColors.primaryColor,
                            ),
                            child: Center(
                              child: Icon(Icons.money),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rizki Nugraha",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                  "Pembayaran pada tanggal 23 Maret 2023 telah berhasil dilakukan."),
                            ],
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                              height: 40,
                              width: 50,
                              child: Text(
                                '10m ago',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              )),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ConstantColors.primaryColor,
                            ),
                            child: Center(
                              child: Icon(Icons.security),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Keamanan",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                  "Jangan lupa untuk memastikan pintu rumah terkunci dengan aman."),
                            ],
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                              height: 40,
                              width: 50,
                              child: Text(
                                '10m ago',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              )),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ConstantColors.primaryColor,
                            ),
                            child: Center(
                              child: Icon(Icons.delete),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kebersihan",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                  "Siapkan sampah anda petugas siap menjemput."),
                            ],
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                              height: 40,
                              width: 50,
                              child: Text(
                                '10m ago',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
