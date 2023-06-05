import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/admin/adminJadwalPagi_page.dart';

class AdminLihatJadwalPage extends StatefulWidget {
  const AdminLihatJadwalPage({super.key});

  @override
  State<AdminLihatJadwalPage> createState() => _AdminLihatJadwalPageState();
}

class _AdminLihatJadwalPageState extends State<AdminLihatJadwalPage> {
  TextEditingController _dateController = TextEditingController();
  String? selectedDateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedDateTime = DateFormat.yMd().format(selectedDate);
        _dateController.text = selectedDateTime.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 15,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Lihat Jadwal",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: ConstantColors.secondaryColor,
        body: ContainedTabBarView(
            tabs: [
              Text(
                "Pagi",
              ),
              Text(
                "Siang",
              ),
              Text(
                "Sore",
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
              AdminJadwalPagiPage(),
              AdminJadwalPagiPage(),
              AdminJadwalPagiPage()
            ]));
    // return Stack(
    //   children: <Widget>[
    //     Positioned(
    //         top: 0,
    //         left: 0,
    //         right: 0,
    //         child: Container(
    //           width: MediaQuery.of(context).size.width,
    //           height: 200,
    //           color: ConstantColors.primaryColor20,
    //           // decoration: BoxDecoration(color: Colors.blue),
    //         )),
    //     Container(
    //       width: MediaQuery.of(context).size.width,
    //       // height: MediaQuery.of(context).size.height,
    //       color: ConstantColors.secondaryColor,
    //       // decoration: BoxDecoration(color: Colors.blue),
    //     ),
    //     Positioned(
    //         top: MediaQuery.of(context).size.height / 2,
    //         left: 0,
    //         right: 0,
    //         child: Container(
    //           width: MediaQuery.of(context).size.width,
    //           // height: MediaQuery.of(context).size.height,
    //           color: ConstantColors.secondaryColor,
    //           // decoration: BoxDecoration(color: Colors.blue),
    //         )),
    //     // Scaffold(
    //     //   body: ContainedTabBarView(
    //     //       tabs: [
    //     //         Text(
    //     //           "Data Warga",
    //     //         ),
    //     //         Text(
    //     //           "Transaksi",
    //     //         ),
    //     //         Text(
    //     //           "Petugas",
    //     //         ),
    //     //       ],
    //     //       tabBarProperties: TabBarProperties(
    //     //         padding: const EdgeInsets.symmetric(
    //     //           horizontal: 00.0,
    //     //           vertical: 8.0,
    //     //         ),
    //     //         background: Container(
    //     //           height: 40,
    //     //           width: 320,
    //     //           decoration: BoxDecoration(
    //     //             borderRadius: BorderRadius.circular(20),
    //     //             color: HexColor("#E8E8E8"),
    //     //           ),
    //     //         ),
    //     //         indicator: ContainerTabIndicator(
    //     //           radius: BorderRadius.circular(20),
    //     //           color: Colors.white,
    //     //           // borderWidth: 2.0,
    //     //           borderColor: Colors.black,
    //     //         ),
    //     //         labelColor: HexColor("#3D8361"),
    //     //         unselectedLabelColor: HexColor("#BDBDBD"),
    //     //       ),
    //     //       views: [
    //     //         AdminJadwalPagiPage(),
    //     //         AdminJadwalPagiPage(),
    //     //         AdminJadwalPagiPage()
    //     //       ]),
    //     // ),
    //     Scaffold(
    //         backgroundColor: Colors.transparent,
    //         body: CustomScrollView(
    //           slivers: <Widget>[
    //             SliverAppBar(
    //               title: Text(
    //                 "Lihat Jadwal",
    //                 style: TextStyle(color: Colors.black),
    //               ),
    //               backgroundColor: Colors.transparent,
    //               elevation: 0,
    //               centerTitle: true,
    //               leading: IconButton(
    //                 icon: Icon(Icons.arrow_back),
    //                 color: Colors.black,
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //               ),
    //             ),
    //             SliverList(
    //               delegate: SliverChildListDelegate(
    //                 [
    //                   ContainedTabBarView(
    //                       tabs: [
    //                         Text(
    //                           "Data Warga",
    //                         ),
    //                         Text(
    //                           "Transaksi",
    //                         ),
    //                         Text(
    //                           "Petugas",
    //                         ),
    //                       ],
    //                       tabBarProperties: TabBarProperties(
    //                         padding: const EdgeInsets.symmetric(
    //                           horizontal: 00.0,
    //                           vertical: 8.0,
    //                         ),
    //                         background: Container(
    //                           height: 40,
    //                           width: 320,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(20),
    //                             color: HexColor("#E8E8E8"),
    //                           ),
    //                         ),
    //                         indicator: ContainerTabIndicator(
    //                           radius: BorderRadius.circular(20),
    //                           color: Colors.white,
    //                           // borderWidth: 2.0,
    //                           borderColor: Colors.black,
    //                         ),
    //                         labelColor: HexColor("#3D8361"),
    //                         unselectedLabelColor: HexColor("#BDBDBD"),
    //                       ),
    //                       views: [
    //                         AdminJadwalPagiPage(),
    //                         AdminJadwalPagiPage(),
    //                         AdminJadwalPagiPage()
    //                       ])
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ))
    //   ],
    // );
  }
}
