import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/admin/viewModel/admin_viewmodel.dart';

import 'model/transaksi_admin.dart';

class AdminDataTransaksiPage extends StatefulWidget {
  const AdminDataTransaksiPage({super.key});

  @override
  State<AdminDataTransaksiPage> createState() => _AdminDataTransaksiPageState();
}

class _AdminDataTransaksiPageState extends State<AdminDataTransaksiPage> {
  TextEditingController editingController = TextEditingController();
  AdminTransaksi? adminTransaksi;

  final duplicateItems =
      List<Widget>.generate(10000, (i) => _buildCard("Item $i"));
  var items = <Widget>[];
  bool tombolget = false;

  String selectedValue = 'Option 1';
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> transaksi = ['Kebersihan', 'Keamanan'];
  String? selectedTransaksi;

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
  String? selectedBulan;

  @override
  void initState() {
    items = duplicateItems;
    // getrealdata();
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

  void getdataReal() {
    // print(selectedTransaksi);
    if (selectedTransaksi == 'Kebersihan') {
      ambilTransaksiKebersihan();
    } else if (selectedTransaksi == 'Keamanan') {
      ambilTransaksiKeamanan();
    }
  }

  void ambilTransaksiKebersihan() {
    getTransaksikebersihan(selectedBulan.toString()).then((value) {
      setState(() {
        adminTransaksi = value;
      });
    });
  }

  void ambilTransaksiKeamanan() {
    getTransaksikeamanan(selectedBulan.toString()).then((value) {
      setState(() {
        adminTransaksi = value;
      });
    });
  }

  static Widget _buildCard(String text) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
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
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: Colors.grey),
            ),
          ),
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
            trailing: Chip(
              label: Text('Sukses'),
              backgroundColor: ConstantColors.primaryColor,
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    filled: true,
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
                isExpanded: true,
                hint: const Text(
                  'Pilih Transaksi',
                  style: TextStyle(fontSize: 14),
                ),
                items: transaksi
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    selectedTransaksi = value.toString();
                    print(selectedTransaksi!.toLowerCase());
                  });
                },
                onSaved: (value) {
                  setState(() {
                    selectedTransaksi = value.toString();
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    filled: true,
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
                isExpanded: true,
                hint: const Text(
                  'Pilih Bulan',
                  style: TextStyle(fontSize: 14),
                ),
                items: bulan
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    selectedBulan = value.toString();
                    print(selectedBulan!.toLowerCase());
                  });
                },
                onSaved: (value) {
                  setState(() {
                    selectedBulan = value.toString();
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            if (adminTransaksi == null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    getdataReal();
                  });
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: ConstantColors.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Cari",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            Expanded(
                child: (adminTransaksi == null)
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: adminTransaksi?.data.length,
                          itemBuilder: (context, index) {
                            var data = adminTransaksi?.data[index];
                            return Card(
                              color: Colors.transparent,
                              elevation: 0,
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
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 2.0, color: Colors.grey),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      data!.users.fullName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    leading: Icon(Icons.person),
                                    subtitle: Text(
                                      '${data.createdAt.toString().substring(0, 10)}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    trailing: Chip(
                                      label: Text('Sukses'),
                                      backgroundColor:
                                          ConstantColors.primaryColor,
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                            ;
                          },
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
