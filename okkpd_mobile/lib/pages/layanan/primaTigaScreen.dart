import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/layanan/detailKomoditasScreen.dart';
import 'package:okkpd_mobile/pages/layanan/infoUsahaScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';


class PrimatigaScreen extends StatefulWidget{
  @override

  _PrimatigaScreen createState() => _PrimatigaScreen();

}

class _PrimatigaScreen extends State<PrimatigaScreen>{

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
          title: Text("Pendaftaran PRIMA 3",style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          child : Column(children: <Widget>[
            InfoUsahaScreen(),
            Expanded(child : DetailKomoditasScreen("prima_3"),)
          ],)
        ),
      );
  }
}