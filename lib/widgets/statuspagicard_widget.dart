import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:trusche/configs/colors.dart';

class StatusPagiCard extends StatefulWidget {
  const StatusPagiCard({super.key});

  @override
  State<StatusPagiCard> createState() => _StatusPagiCardState();
}

class _StatusPagiCardState extends State<StatusPagiCard> {
  Color cardColor = Colors.white;
  IconData recentIcon = Icons.schedule;
  String status = '';
  String desc = '';
  Timer? timerFirst;
  Timer? timerLoop;

  @override
  void initState() {
    super.initState();
    setState(() {
      cardColor = getCurrentColor();
      recentIcon = getCurrentIcon();
    });
    // timerFirst = Timer(Duration(seconds: 1), () {
    // });
    timerLoop = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        cardColor = getCurrentColor();
        recentIcon = getCurrentIcon();
      });
    });
  }

  @override
  void dispose() {
    timerFirst?.cancel(); // Menghentikan timer saat widget dihapus
    timerLoop?.cancel(); // Menghentikan timer saat widget dihapus
    super.dispose();
  }

  Color getCurrentColor() {
    DateTime now = DateTime.now().toUtc().add(const Duration(hours: 7));
    // Atur waktu pada saat card berubah warna
    DateTime start = DateTime.utc(now.year, now.month, now.day, 8, 0, 0);
    DateTime end = DateTime.utc(now.year, now.month, now.day, 9, 0, 0);

    // // Cek apakah waktu saat ini berada di antara waktu yang ditentukan
    if (now.isAfter(start) && now.isBefore(end)) {
      print('Kuning');
      status = 'On Progress';
      desc = 'Sedang dalam perjalanan';
      return Colors.yellow; // Warna saat dalam jangka waktu tertentu
    } else {
      if (now.isBefore(start)) {
        print('Putih');
        status = 'Scheduled';
        desc = 'Sampah akan diangkut';
        return Colors.white; // Warna saat di luar jangka waktu tertentu
      } else {
        print('Ijo');
        status = 'Done';
        desc = 'Sampah telah diangkut';
        return ConstantColors.primaryColor;
      }
    }
  }

  IconData getCurrentIcon() {
    DateTime now = DateTime.now().toUtc().add(const Duration(hours: 7));
    // Atur waktu pada saat card berubah warna
    DateTime start = DateTime.utc(now.year, now.month, now.day, 8, 0, 0);
    DateTime end = DateTime.utc(now.year, now.month, now.day, 9, 0, 0);

    // // Cek apakah waktu saat ini berada di antara waktu yang ditentukan
    if (now.isAfter(start) && now.isBefore(end)) {
      print('Kuning');
      return Icons.local_shipping; // Warna saat dalam jangka waktu tertentu
    } else {
      if (now.isBefore(start)) {
        print('Putih');
        return Icons.schedule; // Warna saat di luar jangka waktu tertentu
      } else {
        print('Ijo');
        return Icons.check_circle;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        splashColor: ConstantColors.primarysplashColor,
        borderRadius: BorderRadius.circular(50),
        onTap: () {},
        child: AnimatedContainer(
          // height: 58,
          width: MediaQuery.of(context).size.width,
          duration:
              Duration(milliseconds: 500), // Durasi animasi perubahan warna
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius:
                BorderRadius.circular(30), // Atur radius border di sini
          ), // Warna card yang berubah
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Row(
              children: [
                Icon(
                  recentIcon,
                  size: 60,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pagi - ${status}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Jadwal Angkut : 08.00 - 09.00",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "${desc}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
