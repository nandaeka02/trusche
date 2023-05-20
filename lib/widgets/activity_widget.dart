import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ConstantColors.primaryColor,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rizki Nugraha",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text("have paid the monthly fee!..."),
            ],
          )),
          const SizedBox(
            width: 8,
          ),
          Container(
              height: 40,
              width: 50,
              child: Text(
                '10m ago',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              )),
        ],
      ),
    );
  }
}
