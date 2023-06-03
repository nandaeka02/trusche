import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trusche/pages/user/model/UserDetail.dart';

Future getuserLogin() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? tokennya = prefs.getString('tokensave');

  try {
    var url = "http://192.168.100.2:8000/api/detailuser";

    var hasil = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $tokennya'});
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("error get data");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      print("Ada login Data");
      final data = userdetailFromJson(hasil.body);
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}
