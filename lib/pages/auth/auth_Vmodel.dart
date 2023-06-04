import 'package:http/http.dart' as http;
import './model/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String token = "";
String tokenstorage = "";
String role = "";

Future iniLogin(String email, String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? action = prefs.getString('tokensave');

  try {
    var url = "http://192.168.100.2:8000/api/login";
    var body = {"email": email, "password": password};
    // return print(body);
    var hasil = await http.post(Uri.parse(url), body: body);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("error login");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Login");
      token = loginModelFromJson(hasil.body).token;
      role = loginModelFromJson(hasil.body).role.first;
      await prefs.setString('tokensave', '$token');

      // print(action);

      return role;
      // return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future iniRegis(String nik, String fullname, String alamat, String no_telp,
    String email, String password) async {
  try {
    var url = "http://192.168.100.2:8000/api/register";
    var body = {
      "nik_user": nik,
      "full_name": fullname,
      "address": alamat,
      "phone_number": no_telp,
      "email": email,
      "password": password,
      "role": "user"
    };
    // return print(body);
    // return print(body);
    var hasil = await http.post(Uri.parse(url), body: body);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("error Daftar");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Daftar");

      // print(action);

      return hasil.statusCode;
      // return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future iniUbahData(String nik, String fullname, String alamat, String no_telp,
    String email, int id) async {
  try {
    var url = "http://192.168.100.2:8000/api/updateuser/$id";
    var body = {
      "nik_user": nik,
      "full_name": fullname,
      "address": alamat,
      "phone_number": no_telp,
      "email": email,
    };
    // return body;
    // return print(body);
    // return print(body);
    var hasil = await http.post(Uri.parse(url), body: body);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("error update");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("Sukses update");

      // print(action);

      return hasil.statusCode;
      // return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}
