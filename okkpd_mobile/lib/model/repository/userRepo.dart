import 'dart:convert';

import 'package:okkpd_mobile/constants/key.dart';
import 'package:http/http.dart' as http;
import 'package:okkpd_mobile/model/responseModel.dart';
import 'package:okkpd_mobile/model/userModel.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  Future<String> getIdProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString('loginId'));
  }

  Future<UserModel> getProfile() async {
    var idUser = await getIdProfile();
    var url = '${Keys.APIURL}user/$idUser';
    var response = await http.get(url);
    var resp = ResponseModel.fromJson(json.decode(response.body));

    if (response.statusCode != 200) {
      FunctionDart().setToast("Ups! Ada kendala pada server.");
      return Future.value(null);
    } else {
      var user = UserModel.fromJson(resp.data);
      return Future.value(user);
    }
  }

  Future<bool> updateProfile(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idUser = await getIdProfile();
    var url = '${Keys.APIURL}user/$idUser';
    var response =
        await http.patch(url, body: {"nama_lengkap": user.namaLengkap});
    var resp = ResponseModel.fromJson(json.decode(response.body));

    if (response.statusCode != 200) {
      FunctionDart().setToast('Tidak ada data yang diubah');
      return Future.value(false);
    } else {
      FunctionDart().setToast(resp.message);
      await prefs.setString('loginNama', user.namaLengkap);
      return Future.value(true);
    }
  }

  Future<bool> updatePassword(String password, String ulangPassword) async {
    var idUser = await getIdProfile();
    var url = '${Keys.APIURL}user/$idUser/password';
    var response = await http.patch(url,
        body: {"password": password, "password_ulang": ulangPassword});
    var resp = ResponseModel.fromJson(json.decode(response.body));
    FunctionDart().setToast(resp.message);
    if (response.statusCode != 200) {
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
