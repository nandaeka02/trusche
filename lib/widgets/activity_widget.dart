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
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: ConstantColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.local_shipping,
                size: 30.0,
                color: Colors.black,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Pengangkutan Sampah",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(
            "Sedang dalam proses...",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          trailing: Text(
            "8m ago",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ));
  }
}
