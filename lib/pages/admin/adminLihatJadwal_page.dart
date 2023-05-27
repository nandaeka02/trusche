import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:trusche/configs/colors.dart';

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
                    "Lihat Jadwal",
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
                      // Padding(
                      //   padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       padding: EdgeInsets.only(top: 16, bottom: 16),
                      //       backgroundColor: ConstantColors.primaryColor,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       ),
                      //     ),
                      //     onPressed: () => _selectDate(context),
                      //     child: Text('Pilih Tanggal'),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                        child: TextFormField(
                          controller: _dateController,
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(14, 16, 14, 16),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Pilih Tanggal",
                            hintStyle: TextStyle(fontSize: 14),
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0)),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                setState(() {
                                  _selectDate(context);
                                  selectedDateTime =
                                      DateFormat.yMd().format(selectedDate);
                                  // _dateController.text = selectedDateTime == null ? '' : selectedDateTime.toString();
                                  _dateController.text =
                                      selectedDateTime.toString();
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong lengkapi Email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      // SizedBox(height: 20),
                      Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
                          // decoration: const BoxDecoration(
                          //   color: ConstantColors.secondaryColor,
                          //   borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(50.0),
                          //     topRight: Radius.circular(50.0),
                          //   ),
                          // ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              const SizedBox(
                                height: 16,
                              ),
                              Card(
                                margin: EdgeInsets.zero,
                                child: ListTile(
                                  title: Text("Test"),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Card(
                                margin: EdgeInsets.zero,
                                child: ListTile(
                                  title: Text("Test"),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
