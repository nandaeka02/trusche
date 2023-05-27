import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/register_page.dart';
import 'package:trusche/pages/user/viewModel/pembayaranVmodel.dart';

class UserPembayaran extends StatefulWidget {
  const UserPembayaran({super.key});

  @override
  State<UserPembayaran> createState() => _UserPembayaranState();
}

class _UserPembayaranState extends State<UserPembayaran> {
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
  String? selectedBulankebersihan;
  String? selectedBulankeamanan;
  String? selectedbank;
  String? selectedewallet;

  bool _obscureText = true;
  final _pageController = PageController(initialPage: 2);

  void initState() {
    super.initState();
    // getPembayaranbyID();
    // getDataLogin();
  }

  void getPembayarankebersihanbyID() {
    getPembayarankebersihansingle(selectedBulankebersihan.toString()).then((value) {
      setState(() {
        if (value == 200) {
          Alert(
            type: AlertType.info,
            context: context,
            title: "Pembayaran",
            desc:
                "Anda Sudah Membayar Iuran Kebersihan Untuk bulan ${selectedBulankebersihan}",
            buttons: [
              DialogButton(
                child: Text(
                  "Batalkan",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: ConstantColors.primaryColor,
                radius: BorderRadius.circular(15.0),
              ),
            ],
          ).show();
        }
      });
      // print(dataMitraHome?.success.first.alamatRestoran);
    });
  }

  void getPembayarankeamananbyID() {
    getPembayarankeamanansingle(selectedBulankeamanan.toString()).then((value) {
      setState(() {
        if (value == 200) {
          Alert(
            type: AlertType.info,
            context: context,
            title: "Pembayaran",
            desc:
                "Anda Sudah Membayar Iuran Keamanan Untuk bulan ${selectedBulankeamanan}",
            buttons: [
              DialogButton(
                child: Text(
                  "Batalkan",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: ConstantColors.primaryColor,
                radius: BorderRadius.circular(15.0),
              ),
            ],
          ).show();
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
        appBar: AppBar(
          toolbarHeight: 15,
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
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: ConstantColors.secondaryColor),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
                                child: DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    //Add isDense true and zero Padding.
                                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    //Add more decoration as you want here
                                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                  ),
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
                                    selectedBulankebersihan = value.toString();
                                    print(selectedBulankebersihan!.toLowerCase());
                                  },
                                  onSaved: (value) {
                                    selectedBulankebersihan = value.toString();
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: 160,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
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
                              Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Total Tagihan"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Rp 125.000",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 130,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Piilh metode pembayaran"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            hint: Row(
                                              children: [
                                                Icon(Icons.credit_card),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Transfer Bank',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            items: bank
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .account_balance_wallet_outlined),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                .toList(),
                                            value: selectedbank,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedbank = value as String;
                                              });
                                            },
                                            buttonStyleData:
                                                const ButtonStyleData(
                                              height: 40,
                                              width: 310,
                                            ),
                                            menuItemStyleData:
                                                const MenuItemStyleData(
                                              height: 40,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            hint: Row(
                                              children: [
                                                Icon(Icons
                                                    .account_balance_wallet_outlined),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'E-Wallet',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            items: ewallet
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .account_balance_wallet_outlined),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                .toList(),
                                            value: selectedewallet,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedewallet =
                                                    value as String;
                                              });
                                            },
                                            buttonStyleData:
                                                const ButtonStyleData(
                                              height: 40,
                                              width: 310,
                                            ),
                                            menuItemStyleData:
                                                const MenuItemStyleData(
                                              height: 40,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  getPembayarankebersihanbyID();
                                },
                                child: Container(
                                  height: 45,
                                  width: 290,
                                  // color: ConstantColors.primaryColor,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: ConstantColors.primaryColor),
                                  child: Center(
                                    child: Text(
                                      "Bayar Sekarang",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
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
                                padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
                                child: DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    //Add isDense true and zero Padding.
                                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    //Add more decoration as you want here
                                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                  ),
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
                                    selectedBulankeamanan = value.toString();
                                    print(selectedBulankeamanan!.toLowerCase());
                                  },
                                  onSaved: (value) {
                                    selectedBulankeamanan = value.toString();
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: 160,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
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
                              Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Total Tagihan"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Rp 65.000",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 130,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Piilh metode pembayaran"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            hint: Row(
                                              children: [
                                                Icon(Icons.credit_card),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Transfer Bank',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            items: bank
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .account_balance_wallet_outlined),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                .toList(),
                                            value: selectedbank,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedbank = value as String;
                                              });
                                            },
                                            buttonStyleData:
                                                const ButtonStyleData(
                                              height: 40,
                                              width: 310,
                                            ),
                                            menuItemStyleData:
                                                const MenuItemStyleData(
                                              height: 40,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            hint: Row(
                                              children: [
                                                Icon(Icons
                                                    .account_balance_wallet_outlined),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'E-Wallet',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            items: ewallet
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .account_balance_wallet_outlined),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                .toList(),
                                            value: selectedewallet,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedewallet =
                                                    value as String;
                                              });
                                            },
                                            buttonStyleData:
                                                const ButtonStyleData(
                                              height: 40,
                                              width: 310,
                                            ),
                                            menuItemStyleData:
                                                const MenuItemStyleData(
                                              height: 40,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  getPembayarankeamananbyID();
                                },
                                child: Container(
                                  height: 45,
                                  width: 290,
                                  // color: ConstantColors.primaryColor,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: ConstantColors.primaryColor),
                                  child: Center(
                                    child: Text(
                                      "Bayar Sekarang",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
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
