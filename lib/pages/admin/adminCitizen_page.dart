import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/admin/adminDataPetugas_page.dart';
import 'package:trusche/pages/admin/adminDataTransaksi_page.dart';
import 'package:trusche/pages/admin/adminDataWarga_page.dart';

class AdminCitizenPage extends StatefulWidget {
  const AdminCitizenPage({super.key});

  @override
  State<AdminCitizenPage> createState() => _AdminCitizenPageState();
}

class _AdminCitizenPageState extends State<AdminCitizenPage> {
  
  final _pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 15,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: ConstantColors.secondaryColor,
        body: ContainedTabBarView(
            tabs: [
              Text(
                "Data Warga",
              ),
              Text(
                "Transaksi",
              ),
              Text(
                "Petugas",
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
              AdminDataWargaPage(),
              AdminDataTransaksiPage(),
              AdminDataPetugasPage()
            ]));
  }
}
