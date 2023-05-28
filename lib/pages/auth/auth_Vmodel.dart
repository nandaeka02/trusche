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
    var url = "http://192.168.100.47:8000/api/login";
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
