import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/layanan/detailKomoditasScreen.dart';
import 'package:okkpd_mobile/pages/layanan/infoUsahaScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Rumahkemas extends StatefulWidget {
  @override
  _Rumahkemas createState() => _Rumahkemas();
}

class _Rumahkemas extends State<Rumahkemas> {
  ProgressDialog pr;

  List getKomoditas = [];
  List komoditas = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pendaftaran Rumah Kemas",
            style: TextStyle(color: Colors.white)),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          InfoUsahaScreen(),
          Expanded(
            child: DetailKomoditasScreen("kemas"),
          )
        ],
      )),
    );
  }
}
