import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/layanan/detailKomoditasScreen.dart';
import 'package:okkpd_mobile/pages/layanan/infoUsahaScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PrimaduaScreen extends StatefulWidget {
  @override
  _PrimaduaScreen createState() => _PrimaduaScreen();
}

class _PrimaduaScreen extends State<PrimaduaScreen> {
 
  ProgressDialog pr;

  List getKomoditas = [];
  List komoditas = [];
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Pendaftaran PRIMA 2",style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          child : Column(children: <Widget>[
            InfoUsahaScreen(),
            Expanded(child : DetailKomoditasScreen("prima_2"),)
          ],)
        ),
      );
  }
}
