import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trusche/configs/colors.dart';

class AdminBuatJadwalPage extends StatefulWidget {
  const AdminBuatJadwalPage({super.key});

  @override
  State<AdminBuatJadwalPage> createState() => _AdminBuatJadwalPageState();
}

class _AdminBuatJadwalPageState extends State<AdminBuatJadwalPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();

  final List<String> _ItemWaktu = [
    "Pagi",
    "Siang",
    "Malam",
  ];
  final List<String> _ItemPetugas = [
    "Sanusi",
    "Didi",
    "Wijaya",
    "Joko",
    "Wahyudi",
    "Sanjaya",
  ];

  String? selectedRW;
  String? selectedRT;
  String? selectedWaktu;
  String? selectedDateTime;

  DateTime selectedDate = DateTime.now();

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
    return Stack(
      children: <Widget>[
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              color: ConstantColors.primaryColor20,
              // decoration: BoxDecoration(color: Colors.blue),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: ConstantColors.secondaryColor,
              // decoration: BoxDecoration(color: Colors.blue),
            )),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(
                    "Buat Jadwal",
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              const SizedBox(height: 16),
                              DropdownButtonFormField2(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    // border: InputBorder.none,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                isExpanded: true,
                                hint: const Text(
                                  'Pilih Waktu',
                                  style: TextStyle(fontSize: 14),
                                ),
                                items: _ItemWaktu.map(
                                    (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ))).toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Tolong lengkapi Waktu.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  selectedWaktu = value.toString();
                                  print(selectedWaktu!.toLowerCase());
                                },
                                onSaved: (value) {
                                  selectedRT = value.toString();
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
                              const SizedBox(height: 16),
                              DropdownButtonFormField2(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    // border: InputBorder.none,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                isExpanded: true,
                                hint: const Text(
                                  'Pilih Petugas',
                                  style: TextStyle(fontSize: 14),
                                ),
                                items: _ItemPetugas.map(
                                    (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ))).toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Tolong lengkapi Petugas.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  selectedRW = value.toString();
                                  print(selectedRW!.toLowerCase());
                                },
                                onSaved: (value) {
                                  selectedRW = value.toString();
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
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _dateController,
                                autofocus: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(14, 16, 14, 16),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Pilih Tanggal",
                                  hintStyle: TextStyle(fontSize: 14),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  // border: InputBorder.none,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      setState(() {
                                        _selectDate(context);
                                        selectedDateTime = DateFormat.yMd()
                                            .format(selectedDate);
                                        // _dateController.text = selectedDateTime == null ? '' : selectedDateTime.toString();
                                        _dateController.text =
                                            selectedDateTime.toString();
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Tolong lengkapi tanggal';
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(height: 32),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(top: 14, bottom: 14),
                                  backgroundColor: ConstantColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    // _loginProgress();
                                    Alert(
                                      type: AlertType.success,
                                      context: context,
                                      title: "Sukses",
                                      desc: "Sukses Menambahkan Jadwal",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Tutup",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          color: ConstantColors.primaryColor,
                                          radius: BorderRadius.circular(15.0),
                                        ),
                                      ],
                                    ).show();
                                  }
                                },
                                child: Text(
                                  'Buat Jadwal',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
