import '../model/alluser_admin.dart';
import 'package:http/http.dart' as http;

import '../model/transaksi_admin.dart';

Future getPetugas() async {
  try {
    var url = "http://192.168.100.47:8000/api/user/petugas";

    var hasil = await http.get(
      Uri.parse(url),
    );
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("error get data petugas");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("sukses Data petugas");
      final data = userRoleAdminFromJson(hasil.body);
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getWarga() async {
  try {
    var url = "http://192.168.100.47:8000/api/user/user";

    var hasil = await http.get(
      Uri.parse(url),
    );
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("error get data petugas");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("sukses Data petugas");
      final data = userRoleAdminFromJson(hasil.body);
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getTransaksikebersihan(String bulan) async {
  try {
    var url = "http://192.168.100.47:8000/api/pembayaranuserall/$bulan";

    var hasil = await http.get(
      Uri.parse(url),
    );
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("error get data petugas");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("sukses Data petugas");
      final data = adminTransaksiFromJson(hasil.body);
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getTransaksikeamanan(String bulan) async {
  try {
    var url = "http://192.168.100.47:8000/api/pembayaranuserkeamananall/$bulan";

    var hasil = await http.get(
      Uri.parse(url),
    );
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("error get data petugas");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("sukses Data petugas");
      final data = adminTransaksiFromJson(hasil.body);
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}
