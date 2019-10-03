import 'dart:convert';

import 'package:okkpd_mobile/constants/key.dart';
import 'package:http/http.dart' as http;
import 'package:okkpd_mobile/model/response_model.dart';
import 'package:okkpd_mobile/model/user_model.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  Future<UserModel> getProfile() async { 
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var idUser = prefs.getString('loginId');
      var url = '${Keys.APIURL}user/$idUser';
      var response = await http.get(url);
      var resp = ResponseModel.fromJson(json.decode(response.body));

      if(response.statusCode != 200){
        FunctionDart().setToast("Ups! Ada kendala pada server.");
        return Future.value(null);
      }else{
        var user = UserModel.fromJson(resp.data);
        return Future.value(user);
      }
  }

}