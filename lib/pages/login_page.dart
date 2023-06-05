import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/admin/adminBottomBar_page.dart';
import 'package:trusche/pages/admin/adminHome_page.dart';
import 'package:trusche/pages/register_page.dart';
import 'package:trusche/pages/user/userHome_page.dart';
import 'package:trusche/pages/user/userbotBar.dart';

import 'auth/auth_Vmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  // _loginProgress() {
  //   if (_emailController.text == 'admin@admin.com' &&
  //       _passwordController.text == '123') {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) => AdminHomePage()),
  //     );
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) => UserHomepage()),
  //     );
  //   }
  // }

  void getRoleLogin() {
    setState(() {
      loading = true;
    });
    iniLogin(_emailController.text, _passwordController.text).then((value) {
      setState(() {
        if (value == "admin") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => AdminBottomBarPage()),
          );
        } else if (value == "user") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => UserbotBar()),
          );
        } else {
          setState(() {
            loading = false;
          });
          Alert(
            type: AlertType.error,
            context: context,
            title: "Gagal",
            desc: "Periksa Email Dan Password Kembali",
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColors.secondaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Log In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      style: TextStyle(fontSize: 12),
                      autofocus: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email Address",
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong lengkapi Email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      style: TextStyle(fontSize: 12),
                      controller: _passwordController,
                      autofocus: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Kata Sandi',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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
                    GestureDetector(
                      child: Text(
                        "Lupa Password",
                        style: TextStyle(
                            color: ConstantColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        backgroundColor: ConstantColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   _formKey.currentState!.save();
                        //   _loginProgress();
                        // }
                        getRoleLogin();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum punya akun? ",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        GestureDetector(
                          child: Text(
                            "Buat akun",
                            style: TextStyle(
                                color: ConstantColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => RegisterPage()),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
