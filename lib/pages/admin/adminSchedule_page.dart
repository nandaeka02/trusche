import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/widgets/schedulecard_widget.dart';

class AdminSchedulePage extends StatefulWidget {
  const AdminSchedulePage({super.key});

  @override
  State<AdminSchedulePage> createState() => _AdminSchedulePageState();
}

class _AdminSchedulePageState extends State<AdminSchedulePage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColors.secondaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              pinned: false,
              title: Text(
                'Schedule',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: ScheduleCard(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.event_available),
                          Text('Lihat Jadwal', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: ScheduleCard(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.edit_calendar),
                          Text('Atur Jadwal', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
