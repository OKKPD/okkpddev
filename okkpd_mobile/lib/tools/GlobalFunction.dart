import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionDart {
  void setToast(String kata) {
    Fluttertoast.showToast(
        msg: "$kata",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  Future<String> getIdProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString('loginId'));
  }

  String getExpirationDate() {
    var now = new DateTime.now();
    var expired = now.add(new Duration(days: 1));
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(expired);
    return formattedDate;
  }

  void setExpirationDate() async {
    String expirationDate = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('expirationDate', expirationDate);
  }

  Future<bool> checkExpirationDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime dateExpiration;
    try {
      dateExpiration = formatStringToDate(prefs.getString("expirationDate"));
      var dateNow = new DateTime.now();
      if (dateNow.isBefore(dateExpiration)) {
        return Future.value(false); //false jika masih belum expired
      } else {
        revokeAccess();
        return Future.value(true); //true jika sudah expired
      }
    } catch (Exception) {
      return Future.value(true); //true jika sudah expired

    }
  }

  void revokeAccess() async {
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

  DateTime formatStringToDate(String tanggal) {
    return DateTime.parse(tanggal);
  }

  static TextFormField textFormField(
      TextEditingController controller, TextInputType type, String label,
      [bool enabled = true]) {
    return TextFormField(
      keyboardType: type,
      enabled: enabled,
      autofocus: false,
      controller: controller,
      decoration: new InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(8.0),
          borderSide: new BorderSide(),
        ),
      ),
    );
  }

  static AppBar setAppBar(String text) {
    return AppBar(
      leading: BackButton(color: Colors.black),
      backgroundColor: Colors.white,
      title: Text(text, style: TextStyle(color: Colors.black87)),
    );
  }

  static BottomAppBar saveButton(
    BuildContext context,
  ) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  // static Padding saveButton(
  //   BuildContext context,
  // ) {
  //   MediaQueryData queryData;
  //   queryData = MediaQuery.of(context);

  //   return Padding(
  //     padding: EdgeInsets.only(
  //         left: 0.0, right: 0.0, top: queryData.size.height / 2.5, bottom: 0.0),
  //     child: MaterialButton(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       minWidth: queryData.size.width,
  //       height: queryData.size.height / 13,
  //       onPressed: () {
  //         // updateProfile();
  //       },
  //       color: Color(0xff2ECC71),
  //       child: Text('Simpan', style: TextStyle(color: Colors.white)),
  //     ),
  //   );
  // }
}
