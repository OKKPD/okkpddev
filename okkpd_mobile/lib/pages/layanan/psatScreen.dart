import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/layanan/detailPsatScreen.dart';
import 'package:okkpd_mobile/pages/layanan/infoUsahaScreen.dart';

import '../../tools/GlobalFunction.dart';

class Psatscreen extends StatefulWidget {
  @override
  _Psatscreen createState() => _Psatscreen();
}

class _Psatscreen extends State<Psatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FunctionDart.setAppBar("Pendaftaran PSAT"),
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
