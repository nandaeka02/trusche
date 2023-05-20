import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/widgets/activity_widget.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/Background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  // title: Text('My App'),
                  backgroundColor: Colors.transparent,
                  pinned: false,
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.logout))
                  ],
                  leading:
                      IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(24, 0, 16, 0),
                        child: Text(
                          "Hallo Admin",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  color: Colors.black45,
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
                          decoration: const BoxDecoration(
                            color: ConstantColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Activity',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              // For list activity
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              ActivityWidget(),
                              // ListView.builder(
                              //   itemCount:
                              //       10, // Jumlah notifikasi
                              //   itemBuilder: (context, index) {
                              //     return ActivityWidget(); // Memanggil widget NotificationWidget
                              //   },
                              // ),
                              const SizedBox(
                                height: 80,
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
