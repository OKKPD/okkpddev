import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:okkpd_mobile/model/repository/userRepo.dart';
import 'package:okkpd_mobile/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilUsahaBody extends StatefulWidget {
  @override
  _ProfilUsahaBody createState() => _ProfilUsahaBody();
}

String jenisUsahaController;
String namaPemohonController;
String jabatanController;
String noKtpController;
String noNpwpController;
String namaPerusahaanController;
String alamatPerusahaanController;
String rtController;
String rwController;
String kotaController;
String noHpController;
String noTelpController;

class _ProfilUsahaBody extends State<ProfilUsahaBody> {
  File imageKTP;
  File imageNPWP;
  File imageKopSurat;

  Color clrKtp = Colors.redAccent;
  Color clrNpwp = Colors.redAccent;
  Color clrKopSurat = Colors.redAccent;

  Future setUser() async {
    UserModel user = await UserRepo().getProfile();
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('loginNama', user.namaLengkap);
      namaPemohonController = user.namaLengkap;
      namaPerusahaanController = user.namaUsaha;
      jenisUsahaController = user.jenisUsaha;
      noHpController = user.noHp;
      noKtpController = user.noKtp;
      alamatPerusahaanController = user.alamatLengkap;
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

    final jenisUsaha =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Jenis Usaha",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
        ),
      ),
      Text(
        (jenisUsahaController != null) ? jenisUsahaController : '-',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

    final namaPemohon =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Nama Pemohon",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
        ),
      ),
      Text(
        (namaPemohonController != null) ? namaPemohonController : '-',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

    final jabatan =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Jabatan Pemohon",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
        ),
      ),
      Text(
        (jabatanController != null) ? jabatanController : '-',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

    final noKtp =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "No KTP",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
        ),
      ),
      Text(
        (noKtpController != null) ? noKtpController : '-',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

    final noNpwp =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "No Npwp",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
        ),
      ),
      Text(
        (noNpwpController != null) ? noNpwpController : '-',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

    final namaPerusahaan =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Nama Perusahaan / Kelompok / Perorangan",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
        ),
      ),
      Text(
        (alamatPerusahaanController != null) ? namaPerusahaanController : '-',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

    final alamatPerusahaan =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Alamat Perusahaan",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
        ),
      ),
      Text(
        (namaPerusahaanController != null) ? alamatPerusahaanController : '-',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

    return Center(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          SingleChildScrollView(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(children: <Widget>[
                jenisUsaha,
                SizedBox(height: 20.0),
                namaPemohon,
                SizedBox(height: 20.0),
                jabatan,
                SizedBox(height: 20.0),
                noKtp,
                SizedBox(height: 20.0),
                noNpwp,
                SizedBox(height: 20.0),
                namaPerusahaan,
                SizedBox(height: 20.0),
                alamatPerusahaan,
                SizedBox(height: 20.0)
              ])),
        ],
      ),
    );
  }
}
