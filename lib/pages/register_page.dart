import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/login_page.dart';

import 'auth/auth_Vmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _notelpController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  bool _obscureText = true;
  bool _isCheckedPersyaratan = false;

  void goRegis() {
    iniRegis(
            _nikController.text,
            _namaController.text,
            _alamatController.text,
            _notelpController.text,
            _emailController.text,
            _passwordController.text)
        .then((value) {
      setState(() {
        if (value == 200) {
          Alert(
            type: AlertType.success,
            context: context,
            title: "Sukses",
            desc: "Register Sukses!",
            buttons: [
              DialogButton(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginPage()),
                ),
                color: ConstantColors.primaryColor,
                radius: BorderRadius.circular(15.0),
              ),
            ],
          ).show();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Register',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
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
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Nomor Induk Kependudukan",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _nikController,
                          autofocus: true,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'NIK',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                                  borderRadius: BorderRadius.circular(10.0))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong lengkapi Nomor Induk Kependudukan';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Nama Lengkap",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _namaController,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Nama Lengkap',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong lengkapi Nama Lengkap';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Email Address",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(color: Colors.grey),
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
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong lengkapi Alamat';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Nomor Telepon",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _notelpController,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            hintText: 'Nomor Telepon',
                            hintStyle: TextStyle(color: Colors.grey),
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
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong lengkapi Nomor Telepon';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Alamat",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _alamatController,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            hintText: 'Alamat',
                            hintStyle: TextStyle(color: Colors.grey),
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
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong lengkapi Email Address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Kata Sandi",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            hintText: 'Kata Sandi',
                            hintStyle: TextStyle(color: Colors.grey),
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
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong lengkapi Kata Sandi';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Konfirmasi Kata Sandi",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _confirmpasswordController,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            hintText: 'Konfirmasi Kata Sandi',
                            hintStyle: TextStyle(color: Colors.grey),
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
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureText,
                          onChanged: (value) {
                            print(value);
                            // if (value != _passwordController.text){
                            //   return 'Konfirmasi Kata Sandi harus sama dengan Kata Sandi ';
                            // }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tolong lengkapi Konfirmasi Kata Sandi';
                            }
                            print(value);
                            if (value != _passwordController.text) {
                              return 'Konfirmasi Kata Sandi harus sama dengan Kata Sandi ';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 16),
                        CheckboxListTile(
                          title: Text(
                            "Setuju dengan syarat dan ketentuan",
                            style: TextStyle(fontSize: 14),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _isCheckedPersyaratan = value;
                              });
                            }
                          },
                          value: _isCheckedPersyaratan,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            backgroundColor: ConstantColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _isCheckedPersyaratan == true) {
                              _formKey.currentState!.save();
                              goRegis();
                            }
                          },
                          child: Text(
                            'Daftar',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
