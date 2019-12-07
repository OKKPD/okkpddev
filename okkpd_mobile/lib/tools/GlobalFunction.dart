
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionDart{
  void setToast(String kata){
    Fluttertoast.showToast(
          msg: "$kata",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
        );
  }

  Future<String> getIdProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString('loginId'));
  }

  String getExpirationDate(){
    var now = new DateTime.now();
    var expired = now.add(new Duration(days: 1));
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(expired);
    return formattedDate;
  }


  void setExpirationDate() async{
    String expirationDate = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('expirationDate', expirationDate);
  }

  Future<bool> checkExpirationDate() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime dateExpiration;
    try{
      dateExpiration = formatStringToDate(prefs.getString("expirationDate"));
      var dateNow = new DateTime.now();
      if(dateNow.isBefore(dateExpiration)){
        return Future.value(false); //false jika masih belum expired
      }else{
        revokeAccess();
        return Future.value(true); //true jika sudah expired
      }
    }catch(Exception){
      return Future.value(true); //true jika sudah expired

    }

  }

  void revokeAccess() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loginFolder');
    await prefs.remove('loginId');
    await prefs.remove('loginidUsaha');
    await prefs.remove('loginNama');
    await prefs.remove('loginEmail');
    await prefs.remove('loginRole');
    await prefs.remove('loginNamaRole');
    await prefs.remove('expirationDate');
  }

  DateTime formatStringToDate(String tanggal){
    return DateTime.parse(tanggal);
  }
}