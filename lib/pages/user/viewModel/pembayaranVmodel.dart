import 'package:http/http.dart' as http;

import '../model/HistoryPembayaran.dart';

late HistoryPembayaran historyPembayaran;

Future getPembayarankeamanansingle(String bulan) async {
  try {
    var url = "http://172.34.218.146:8000/api/pembayarankeamanan/2/$bulan";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("noData");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("Ada Data");
      return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getPembayarankebersihansingle(String bulan) async {
  try {
    var url = "http://172.34.218.146:8000/api/pembayaran/2/$bulan";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("noData");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("Ada Data");
      return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getPembayaranhist(int id) async {
  try {
    print(id);
    var url = "http://172.34.218.146:8000/api/pembayaranuser/$id";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Banner");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      // historyPembayaran = historyPembayaranFromJson(hasil.body.toString());
      final data = historyPembayaranFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getPembayarankeamananhist(int id) async {
  try {
    var url = "http://172.34.218.146:8000/api/pembayarankeamananuser/$id";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses");
      // print(hasil.body.le);
      // historyPembayaran = historyPembayaranFromJson(hasil.body.toString());
      final data = historyPembayaranFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}
