import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/configs/dataWarga.dart';
import 'package:trusche/pages/admin/adminDetailUser_page.dart';
import 'package:trusche/pages/admin/viewModel/admin_viewmodel.dart';

import 'model/alluser_admin.dart';
import 'model/singleuser_admin.dart';

class AdminDataSinglePage extends StatefulWidget {
  final int idnya;
  const AdminDataSinglePage({super.key, required this.idnya});

  @override
  State<AdminDataSinglePage> createState() => _AdminDataSinglePageState();
}

class _AdminDataSinglePageState extends State<AdminDataSinglePage> {
  TextEditingController editingController = TextEditingController();

  List<dataWarga> dataWargas = allDataWarga;
  var items = <Widget>[];
  // UserRoleAdmin? userRoleAdmin;
  AdminUserSingle? adminUserSingle;

  @override
  void initState() {
    // items = duplicateItems;
    ambilWargasigle();
    // print(widget.idnya);
    super.initState();
  }

  void ambilWargasigle() {
    getWargasingle(widget.idnya).then((value) {
      setState(() {
        adminUserSingle = value;
        print(adminUserSingle!.user.first.fullName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: ConstantColors.secondaryColor,
      body: (adminUserSingle == null)
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      radius: 45,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    adminUserSingle!.user.first.fullName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 290,
                    width: 280,
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          adminUserSingle!.user.first.email,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "NIK",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          adminUserSingle!.user.first.nikUser,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "No Telp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          adminUserSingle!.user.first.phoneNumber,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Alamat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          adminUserSingle!.user.first.address,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
    );
  }

  void searchDataWarga(String query) {
    final suggestions = allDataWarga.where((data) {
      final namaDataWarga = data.name.toLowerCase();
      final input = query.toLowerCase();

      return namaDataWarga.contains(input);
    }).toList();

    setState(() => dataWargas = suggestions);
  }
}
