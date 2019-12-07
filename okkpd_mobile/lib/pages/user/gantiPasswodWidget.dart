import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/repository/userRepo.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:progress_dialog/progress_dialog.dart';

class GantiPasswordscreen extends StatefulWidget {
  @override
  _GantiPasswordscreen createState() => _GantiPasswordscreen();
}

class _GantiPasswordscreen extends State<GantiPasswordscreen> {
  var _passwordBaruController = TextEditingController();
  var _passwordBaru2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    ProgressDialog pr;
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    Future updateProfile() async {
      if (_passwordBaruController.text.isEmpty ||
          _passwordBaru2Controller.text.isEmpty) {
        FunctionDart().setToast("Password harus diisi");
      } else {
        pr.show();
        Future<bool> resultLogin = UserRepo().updatePassword(
            _passwordBaruController.text, _passwordBaru2Controller.text);
        if (await resultLogin == true) {
          pr.dismiss();
          _passwordBaruController.clear();
          _passwordBaru2Controller.clear();
        } else {
          pr.dismiss();
        }
      }
    }

    final saveButton = Padding(
      padding: EdgeInsets.only(
          left: 0.0,
          right: 0.0,
          top: queryData.size.height / 1.95,
          bottom: 0.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minWidth: queryData.size.width,
        height: queryData.size.height / 13,
        onPressed: () {
          updateProfile();
        },
        color: Color(0xff2ECC71),
        child: Text('Simpan', style: TextStyle(color: Colors.white)),
      ),
    );

    final passwordBaru =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      FunctionDart.textFormField(
          _passwordBaruController, TextInputType.text, 'Password Baru')
    ]);

    final passwordBaru2 =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      FunctionDart.textFormField(
          _passwordBaru2Controller, TextInputType.text, 'Ulangi Password')
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FunctionDart.setAppBar("Ubah Password"),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            passwordBaru,
            SizedBox(height: 20.0),
            passwordBaru2,
            SizedBox(height: 20.0),
            saveButton,
          ],
        ),
      ),
    );
  }
}
