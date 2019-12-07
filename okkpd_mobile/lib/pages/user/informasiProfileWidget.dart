import 'package:flutter/material.dart';

import 'package:okkpd_mobile/model/repository/userRepo.dart';
import 'package:okkpd_mobile/model/userModel.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../tools/CustomWidget.dart';

class InformasiProfilescreen extends StatefulWidget {
  @override
  _InformasiProfilescreen createState() => _InformasiProfilescreen();
}

class _InformasiProfilescreen extends State<InformasiProfilescreen> {
  var _namaController = TextEditingController();
  var _emailController = TextEditingController();
  var _jabatanController = TextEditingController();
  String idUser;

  bool isLoading = true;

  Future setUser() async {
    UserModel user = await UserRepo().getProfile();
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      idUser = prefs.getString('loginId');
      prefs.setString('loginNama', user.namaLengkap);
      _namaController.text = user.namaLengkap;
      _emailController.text = prefs.getString('loginEmail');
      _jabatanController.text = prefs.getString('loginRole');

      setState(() {
        if (_namaController.text != '') {
          isLoading = false;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setUser();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    ProgressDialog pr;
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    Future updateProfile() async {
      if (_namaController.text.isEmpty) {
        FunctionDart().setToast("Nama harus diisi");
      } else {
        pr.show();
        UserModel user =
            new UserModel('', '', '', '', '', '', '', '', '', '', '', '', '');
        user.namaLengkap = _namaController.text;
        Future<bool> resultLogin = UserRepo().updateProfile(user);
        if (await resultLogin == true) {
          pr.dismiss();
          setUser();
        } else {
          pr.dismiss();
        }
      }
    }

    final saveButton = Padding(
      padding: EdgeInsets.only(
          left: 0.0, right: 0.0, top: queryData.size.height / 2.5, bottom: 0.0),
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            updateProfile();
          },
          color: Colors.lightBlueAccent,
          child: Text('Simpan', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final nama =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Nama Lengkap",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _namaController,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    final email =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Email",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        readOnly: true,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    final jabatan =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Akun",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _jabatanController,
        keyboardType: TextInputType.text,
        autofocus: false,
        readOnly: true,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Informasi Profil", style: TextStyle(color: Colors.white)),
      ),
      body: (isLoading)
          ? CustomWidget().loadingWidget()
          : Center(
              child: ListView(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  SizedBox(height: 20.0),
                  nama,
                  SizedBox(height: 20.0),
                  email,
                  SizedBox(height: 20.0),
                  jabatan,
                  SizedBox(height: 20.0),
                  saveButton,
                ],
              ),
            ),
    );
  }
}
