import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';
import 'package:trusche/pages/user/viewModel/pembayaranVmodel.dart';

import 'model/HistoryPembayaran.dart';

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

  HistoryPembayaran? historyPembayarankebersihan;
  HistoryPembayaran? historyPembayarankeamanan;

  bool _obscureText = true;
  final _pageController = PageController(initialPage: 2);

  void initState() {
    super.initState();
    getPembayaranHistory();
    getPembayarankeamananHistory();
    // getDataLogin();
  }

  void getPembayaranHistory() {
    getPembayaranhist().then((value) {
      setState(() {
        historyPembayarankebersihan = value;
        if (historyPembayarankebersihan != null) {
          print("bisa");
        }
      });
      // print(dataMitraHome?.success.first.alamatRestoran);
    });
  }
  void getPembayarankeamananHistory() {
    getPembayarankeamananhist().then((value) {
      setState(() {
        historyPembayarankeamanan = value;
        if (historyPembayarankeamanan != null) {
          print("bisa");
        }
      });
      // print(dataMitraHome?.success.first.alamatRestoran);
    });
  }

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
              SizedBox(
                height: 50,
              ),
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
                            child: historyPembayarankebersihan == null
                                      ? Center(
                                          child: Scaffold(
                                          backgroundColor: ConstantColors.secondaryColor,
                                          body: Center(
                                              child: Text(
                                            "Tidak ada riwayat pembayaran"
                                          )),
                                        ))
                                      : ListView.builder(
                                itemCount: historyPembayarankebersihan?.data.length,
                                itemBuilder: (context, i) {
                                  var data = historyPembayarankebersihan?.data[i];
                                  return Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(padding: EdgeInsets.all(0), 
                                              child: data!.status == "Berhasil"
                                              ? Icon(
                                                Icons.circle_rounded,
                                                color: ConstantColors.primaryColor,
                                              )
                                              :Icon(
                                                Icons.circle_rounded,
                                                color: Colors.grey,
                                              )
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Text(data!.pembayaranBulan + " 2023"),
                                              ),
                                              Spacer(),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(data.status),
                                              )
                                            ],
                                          ),
                                        ],
                                      ));
                                })),
                        Container(
                            decoration: BoxDecoration(
                                color: ConstantColors.secondaryColor),
                            child: historyPembayarankeamanan == null
                                      ? Center(
                                          child: Scaffold(
                                          backgroundColor: ConstantColors.secondaryColor,
                                          body: Center(
                                              child: Text(
                                            "Tidak ada riwayat pembayaran"
                                          )),
                                        ))
                                      : ListView.builder(
                                itemCount: historyPembayarankeamanan?.data.length,
                                itemBuilder: (context, i) {
                                  var data = historyPembayarankeamanan?.data[i];
                                  return Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(padding: EdgeInsets.all(0), 
                                              child: data!.status == "Berhasil"
                                              ? Icon(
                                                Icons.circle_rounded,
                                                color: ConstantColors.primaryColor,
                                              )
                                              :Icon(
                                                Icons.circle_rounded,
                                                color: Colors.grey,
                                              )
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Text(data!.pembayaranBulan + " 2023"),
                                              ),
                                              Spacer(),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(data.status),
                                              )
                                            ],
                                          ),
                                        ],
                                      ));
                                })),
                      ]))
            ],
          ),
        ));
  }
}
