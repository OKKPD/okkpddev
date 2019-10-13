import 'dart:convert';

import 'package:okkpd_mobile/constants/key.dart';
import 'package:http/http.dart' as http;
import 'package:okkpd_mobile/model/komoditasModel.dart';
import 'package:okkpd_mobile/model/responseModel.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KomoditasRepo {
  Future<bool> postKomoditas(
      KomoditasModel komoditas,
      String jenis) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var idUsaha = prefs.getString('loginidUsaha');

      List<KomoditasModel> komoditases = List();
      komoditases.add(komoditas);

      var url = '${Keys.APIURL}layanan/$idUsaha/daftar/$jenis';
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(komoditases)
      );

      print(url);
      print(response.body);

      var resp = ResponseModel.fromJson(json.decode(response.body));
      FunctionDart().setToast(resp.message);
      if (response.statusCode != 200) {
        return Future.value(false);
      } else {
        return Future.value(true);
      }
  }
}
