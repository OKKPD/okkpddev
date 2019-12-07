import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/layanan/detailHcScreen.dart';
import 'package:okkpd_mobile/pages/layanan/infoUsahaScreen.dart';

import '../../tools/GlobalFunction.dart';

class Hcscreen extends StatefulWidget {
  @override
  _Hcscreen createState() => _Hcscreen();
}

class _Hcscreen extends State<Hcscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FunctionDart.setAppBar("Pendaftaran HC"),
      body: Container(
        child: Column(
          children: <Widget>[
            InfoUsahaScreen(),
            Expanded(
              child: DetailHcScreen("HC"),
            )
          ],
        ),
      ),
    );
  }
}
