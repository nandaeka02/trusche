import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/admin/adminChatRoom_page.dart';

class AdminChatPage extends StatefulWidget {
  const AdminChatPage({super.key});

  @override
  State<AdminChatPage> createState() => _AdminChatPageState();
}

class _AdminChatPageState extends State<AdminChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.abc, size: 0),
          title: Text(
            "ChatBox",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: ConstantColors.secondaryColor,
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            children: [
              InkWell(
                  splashColor: ConstantColors.primarysplashColor,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminChatRoomPage()),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: ConstantColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avataaarsmale.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Rizki Nugraha",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Asking for help....",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "8m ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
              InkWell(
                  splashColor: ConstantColors.primarysplashColor,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminChatRoomPage()),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    leading: Container(
                      // color: ConstantColors.primaryColor,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: ConstantColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avataaars.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Audy Renata",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Dok saya ada keluhan...",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "8m ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
              InkWell(
                  splashColor: ConstantColors.primarysplashColor,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminChatRoomPage()),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: ConstantColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avataaarsmale.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Rizki Nugraha",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Asking for help....",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "8m ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
              InkWell(
                  splashColor: ConstantColors.primarysplashColor,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminChatRoomPage()),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    leading: Container(
                      // color: ConstantColors.primaryColor,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: ConstantColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avataaars.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Audy Renata",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Dok saya ada keluhan...",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "8m ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
              InkWell(
                  splashColor: ConstantColors.primarysplashColor,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminChatRoomPage()),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: ConstantColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avataaarsmale.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Rizki Nugraha",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Asking for help....",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "8m ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
              InkWell(
                  splashColor: ConstantColors.primarysplashColor,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminChatRoomPage()),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    leading: Container(
                      // color: ConstantColors.primaryColor,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: ConstantColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avataaars.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Audy Renata",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Dok saya ada keluhan...",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "8m ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
              InkWell(
                  splashColor: ConstantColors.primarysplashColor,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminChatRoomPage()),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: ConstantColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avataaarsmale.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Rizki Nugraha",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Asking for help....",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "8m ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
              InkWell(
                  splashColor: ConstantColors.primarysplashColor,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminChatRoomPage()),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    leading: Container(
                      // color: ConstantColors.primaryColor,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: ConstantColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avataaars.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Audy Renata",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Dok saya ada keluhan...",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "8m ago",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )),
            ],
          ),
        ));
  }
}
