import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';

class UserChatRoomPage extends StatefulWidget {
  final String chat;
  const UserChatRoomPage({super.key, required this.chat});

  @override
  State<UserChatRoomPage> createState() => _UserChatRoomPageState();
}

class _UserChatRoomPageState extends State<UserChatRoomPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          250, // Ganti dengan lebar maksimum yang diinginkan
                    ),
                    child: Card(
                      color: ConstantColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                          bottomRight: Radius
                              .zero, // Tidak ada borderRadius pada sisi ini
                          bottomLeft: Radius.circular(12.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          widget.chat,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Form(
              key: _formKey,
              child: TextFormField(
                style: TextStyle(fontSize: 12),
                controller: _messageController,
                autofocus: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Pesan..",
                  hintStyle: TextStyle(fontSize: 12),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  // border: InputBorder.none,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(50.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50.0)),
                  suffixIcon: IconButton(
                    color: ConstantColors.primaryColor,
                    icon: Icon(Icons.send),
                    onPressed: () {
                      setState(() {});
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
          )),
    );
  }
}
