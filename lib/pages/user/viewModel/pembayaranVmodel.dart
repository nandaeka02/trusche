import 'package:http/http.dart' as http;

import '../model/HistoryPembayaran.dart';

late HistoryPembayaran historyPembayaran;

Future getPembayarankeamanansingle(String bulan) async {
  try {
    var url = "http://192.168.100.47:8000/api/pembayarankeamanan/2/$bulan";

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
    var url = "http://192.168.100.47:8000/api/pembayaran/2/$bulan";

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

Future getPembayaranhist() async {
  try {
    var url = "http://192.168.100.47:8000/api/pembayaranuser/2";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Banner");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin Banner");
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

Future getPembayarankeamananhist() async {
  try {
    var url = "http://192.168.100.47:8000/api/pembayarankeamananuser/2";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Banner");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin Banner");
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
