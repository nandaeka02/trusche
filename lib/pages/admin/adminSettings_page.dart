import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';

class AdminSettingsPage extends StatefulWidget {
  const AdminSettingsPage({super.key});

  @override
  State<AdminSettingsPage> createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _soundNotifController = TextEditingController();
  TextEditingController _languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/Background.png'), // Ganti dengan path ke gambar Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text('Settings'),
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
                  decoration: const BoxDecoration(
                    color: ConstantColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Transform.translate(
                      offset:
                          Offset(0, -80), // Mengatur posisi vertikal ke atas
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 65,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 60,
                              foregroundImage: Image.asset(
                                'assets/images/avataaars.png',
                              ).image,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Halo, Admin',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const SizedBox(height: 16),
                                Text(
                                  "Username",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  controller: _usernameController,
                                  autofocus: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(14, 16, 14, 16),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Username",
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
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Tolong lengkapi Username';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Password",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  controller: _passwordController,
                                  autofocus: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(14, 16, 14, 16),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Password",
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
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Tolong lengkapi Password';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Email Address",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  controller: _emailController,
                                  autofocus: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(14, 16, 14, 16),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Email Address",
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
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
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
                                  "Suara Notifikasi",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  controller: _emailController,
                                  autofocus: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(14, 16, 14, 16),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Suara Notifikasi",
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
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Tolong lengkapi Suara Notifikasi';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Bahasa",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  controller: _emailController,
                                  autofocus: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(14, 16, 14, 16),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Bahasa",
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
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Tolong lengkapi Bahasa';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 32),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.only(top: 14, bottom: 14),
                                    backgroundColor:
                                        ConstantColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    // if (_formKey.currentState!.validate()) {
                                    //   _formKey.currentState!.save();
                                    //   // _loginProgress();
                                    // }
                                  },
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Center(
                                  child: Text(
                                    "V 1.0.0",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
