import 'dart:convert';

import 'package:okkpd_mobile/constants/key.dart';
import 'package:http/http.dart' as http;
import 'package:okkpd_mobile/model/response_model.dart';
import 'package:okkpd_mobile/model/user_model.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  Future<bool> loginProcess(String username, String password) async { 
    if(username.isEmpty || password.isEmpty){
        FunctionDart().setToast("Username atau password masih kosong");
    }else{
      var url = '${Keys.APIURL}login';
      var response = await http.post(url, body: {'username': username, 'password': password, "role":"pelaku"});
      var message = "Login Sukses";
      var resp = ResponseModel.fromJson(json.decode(response.body));
      if(response.statusCode != 200){
        message = resp.message;
        FunctionDart().setToast(message);
        return Future.value(false);
      }else{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var user = UserModel.fromJson(resp.data);
        await prefs.setString('loginFolder', user.folder);
        await prefs.setString('loginId', user.idUser);
        await prefs.setString('loginidUsaha', user.idIdentitasUsaha);
        return Future.value(true);
      }
    }
  }

  void logoutProcess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loginFolder');
    await prefs.remove('loginId');
    await prefs.remove('loginidUsaha');
  }
}