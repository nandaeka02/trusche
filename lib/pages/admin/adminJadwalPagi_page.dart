import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';

class AdminJadwalPagiPage extends StatelessWidget {
  // const AdminJadwalPagiPage({super.key});
  final List<String> items = [
    'Budi Santoso',
    'Siti Rahayu',
    'Joko Susanto',
    'Rina Wijaya',
    'Ahmad Hidayat',
    'Yanti Kusuma',
    'Hadi Prasetyo',
    'Dewi Puspita',
    'Rudi Setiawan',
    'Maya Sari',
  ];
  final List<String> alamat = [
    'Jl. Ahmad Yani No. 123, Jakarta',
    'Jl. Pahlawan No. 456, Bandung',
    'Jl. Diponegoro No. 789, Surabaya',
    'Jl. Gatot Subroto No. 321, Yogyakarta',
    'Jl. Sudirman No. 654, Medan',
    'Jl. Gajah Mada No. 987, Semarang',
    'Jl. Imam Bonjol No. 135, Makassar',
    'Jl. Sisingamangaraja No. 864, Palembang',
    'Jl. Thamrin No. 246, Bali',
    'Jl. Merdeka No. 753, Malang',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                  title: Text(
                    items[index],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    alamat[index],
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ConstantColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'RT 01',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            );
          },
        ));
  }
}
