import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/widgets/statusmalamcard_widget.dart';
import 'package:trusche/widgets/statuspagicard_widget.dart';
import 'package:trusche/widgets/statussiangcard_widget.dart';

class AdminStatusPage extends StatefulWidget {
  const AdminStatusPage({super.key});

  @override
  State<AdminStatusPage> createState() => _AdminStatusPageState();
}

class _AdminStatusPageState extends State<AdminStatusPage> {
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
                // SliverAppBar(
                //   backgroundColor: Colors.transparent,
                //   pinned: false,
                // ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(
                        height: 48,
                      ),
                      Center(
                        child: Text(
                          "Status",
                          style: TextStyle(
                              letterSpacing: 1.5,
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
                      Center(
                        child: Text(
                          "Aktivitas Hari Ini",
                          style: TextStyle(
                              letterSpacing: 1.2,
                              color: Colors.white,
                              fontSize: 18,
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
                        height: 48,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                          decoration: const BoxDecoration(
                            color: ConstantColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              StatusMalamCard(),
                              const SizedBox(
                                height: 16,
                              ),
                              StatusSiangCard(),
                              const SizedBox(
                                height: 16,
                              ),
                              StatusPagiCard(),
                              // Padding(
                              //   padding: EdgeInsets.all(24),
                              //   child: 
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
