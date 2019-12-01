import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/aktorDinas/infoUserWidget.dart';
import 'package:okkpd_mobile/pages/aktorDinas/layananDiterimaScreen.dart';
import 'package:okkpd_mobile/pages/aktorDinas/menuWidget.dart';

class DashboardDinasScreen extends StatefulWidget {
  @override
  _DashboardDinasScreenState createState() => _DashboardDinasScreenState();
}

class _DashboardDinasScreenState extends State<DashboardDinasScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          iconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 87)),
          backgroundColor: Colors.white,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          leading: new Container(),
          title: Container(
              width: 130,
              height: 100,
              alignment: AlignmentDirectional(2.0, 0.0),
              child: Image(image: AssetImage('assets/logo.png'))),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          InfoUserWidget(),
          MenuWidget()
        ],)
        );
  }
}
