import 'package:http/http.dart' as http;

import '../model/HistoryPembayaran.dart';

late HistoryPembayaran historyPembayaran;

Future getPembayarankeamanansingle(String bulan) async {
  try {
    var url = "http://192.168.100.2:8000/api/pembayarankeamanan/2/$bulan";

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

Future postKeamananUser(
    String status, String pembayaran_bulan, String users_id) async {
  try {
    var url = "http://192.168.100.2:8000/api/tambahpembayarankeamanan";
    var body = {
      "status": status,
      "pembayaran_bulan": pembayaran_bulan,
      "users_id": users_id
    };
    // return print(body);
    // return print(body);
    var hasil = await http.post(Uri.parse(url), body: body);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 201) {
      print("post gagal");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 201) {
      print("Post Sukses");
      return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future postKebersihanUser(
    String status, String pembayaran_bulan, String users_id) async {
  try {
    var url = "http://192.168.100.2:8000/api/tambahpembayarankebersihan";
    var body = {
      "status": status,
      "pembayaran_bulan": pembayaran_bulan,
      "users_id": users_id
    };
    // return print(body);
    var hasil = await http.post(Uri.parse(url), body: body);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 201) {
      print("post gagal");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 201) {
      print("Post Sukses");
      return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getPembayarankebersihansingle(String bulan) async {
  try {
    var url = "http://192.168.100.2:8000/api/pembayaran/2/$bulan";

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
    var url = "http://192.168.100.2:8000/api/pembayaranuser/$id";

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
    var url = "http://192.168.100.2:8000/api/pembayarankeamananuser/$id";

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
