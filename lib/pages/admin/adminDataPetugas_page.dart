import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/admin/viewModel/admin_viewmodel.dart';

import 'adminDataSingle_page.dart';
import 'model/alluser_admin.dart';

class AdminDataPetugasPage extends StatefulWidget {
  const AdminDataPetugasPage({super.key});

  @override
  State<AdminDataPetugasPage> createState() => _AdminDataPetugasPageState();
}

class _AdminDataPetugasPageState extends State<AdminDataPetugasPage> {
  TextEditingController editingController = TextEditingController();
  UserRoleAdmin? userRoleAdmin;

  final duplicateItems =
      List<Widget>.generate(10000, (i) => _buildCard("Item $i"));
  var items = <Widget>[];

  @override
  void initState() {
    items = duplicateItems;
    ambilPetugas();
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = duplicateItems.where((widget) {
        if (widget is Card) {
          Card card = widget;
          if (card.child is InkWell) {
            InkWell inkWell = card.child as InkWell;
            if (inkWell.child is Container) {
              Container container = inkWell.child as Container;
              if (container.child is ListTile) {
                ListTile listTile = container.child as ListTile;
                return listTile.title
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase());
              }
            }
          }
        }
        return false;
      }).toList();
    });
  }

  void ambilPetugas() {
    getPetugas().then((value) {
      setState(() {
        userRoleAdmin = value;
      });
    });
  }

  static Widget _buildCard(String text) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        splashColor: ConstantColors.primarysplashColor,
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(8),
          // height: 58,
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(Icons.person),
            subtitle: Text(
              'Bojong Gede Blok TD 6 No 5A RT 002 RW 012',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (userRoleAdmin == null)
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: TextField(
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search",
                          suffixIcon: Icon(Icons.search),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          // border: InputBorder.none,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: userRoleAdmin?.user.length,
                      itemBuilder: (context, index) {
                        var petugas = userRoleAdmin?.user[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminDataSinglePage(
                                        idnya: petugas!.id,
                                      )),
                            );
                          },
                          child: Card(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                                title: Text(
                                  userRoleAdmin?.user[index].fullName ?? "null",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                leading: Icon(Icons.person, size: 50),
                                subtitle: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    // 'Bojong Gede Blok TD 6 No 5A RT 002 RW 012',
                                    userRoleAdmin?.user[index].address ??
                                        'null',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  )),
                ],
              ),
            ),
          );
  }
}
