import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/layanan/detailPsatScreen.dart';
import 'package:okkpd_mobile/pages/layanan/infoUsahaScreen.dart';

class Psatscreen extends StatefulWidget {
  @override
  _Psatscreen createState() => _Psatscreen();
}

class _Psatscreen extends State<Psatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pendaftaran Psat", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            InfoUsahaScreen(),
            Expanded(
              child: DetailPsatScreen("Psat"),
            )
          ],
        ),
      ),
    );
  }
}
