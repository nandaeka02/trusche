import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';

class ScheduleCard extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  ScheduleCard({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstantColors.primaryColor,
      margin: EdgeInsets.all(0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        splashColor: ConstantColors.primarysplashColor,
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Container(
          // height: 58,
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 32, 24, 32),
            child: child,
          ),
        ),
      ),
    );
  }
}
