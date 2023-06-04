import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/user/model/UserDetail.dart';
import 'package:trusche/pages/user/viewModel/getUserVmodel.dart';

import 'admin/adminBottomBar_page.dart';
import 'auth/auth_Vmodel.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  Userdetail? userdetail;

  void getUser() {
    getuserLogin().then((value) {
      setState(() {
        userdetail = value;
        _nikController.text = userdetail!.user.nikUser;
        _fullnameController.text = userdetail!.user.fullName;
        _addressController.text = userdetail!.user.address;
        _phonenumberController.text = userdetail!.user.phoneNumber;
        _emailController.text = userdetail!.user.email;
        // print(userdetail?.user.email);
      });
    });
  }

  void ubahData() {
    iniUbahData(
            _nikController.text,
            _fullnameController.text,
            _addressController.text,
            _phonenumberController.text,
            _emailController.text,
            userdetail!.user.id)
        .then((value) {
      setState(() {
        if (value == 200) {
          print("sukses");
          Alert(
            type: AlertType.success,
            context: context,
            title: "Sukses",
            desc: "Sukses Mengubah Data",
            buttons: [
              DialogButton(
                child: Text(
                  "Tutup",
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
    });
  }

  void initState() {
    super.initState();
    getUser();
    // getDataLogin();
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
            body: (userdetail == null)
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        title: Text(
                          "Ubah Profile",
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    TextFormField(
                                      controller: _nikController,
                                      style: TextStyle(fontSize: 12),
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.fromLTRB(16, 8, 16, 8),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "NIK",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          // border: InputBorder.none,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Tolong lengkapi Nik';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: _fullnameController,
                                      style: TextStyle(fontSize: 12),
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.fromLTRB(16, 8, 16, 8),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "Full Name",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          // border: InputBorder.none,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Tolong lengkapi Full Name';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: _addressController,
                                      style: TextStyle(fontSize: 12),
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.fromLTRB(16, 8, 16, 8),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "Alamat",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          // border: InputBorder.none,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Tolong lengkapi Alamat';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: _phonenumberController,
                                      style: TextStyle(fontSize: 12),
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.fromLTRB(16, 8, 16, 8),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "Nomor Telepon",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          // border: InputBorder.none,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Tolong lengkapi Nomor Telepon';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: _emailController,
                                      style: TextStyle(fontSize: 12),
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.fromLTRB(16, 8, 16, 8),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "Email",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          // border: InputBorder.none,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Tolong lengkapi Email';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            top: 14, bottom: 14),
                                        backgroundColor:
                                            ConstantColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          // _loginProgress();
                                          ubahData();
                                        }
                                      },
                                      child: Text(
                                        'Ubah Profile',
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
