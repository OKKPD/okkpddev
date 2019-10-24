import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:okkpd_mobile/constants/key.dart';
import 'package:okkpd_mobile/pages/dashboard/dashboarLayananWidget.dart';
//import 'package:okkpd_mobile/pages/guest/barcodeScreen.dart';

class GuestScreen extends StatefulWidget {
  @override
  _GuestScreen createState() => _GuestScreen();
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class _GuestScreen extends State<GuestScreen> {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  color: Color.fromRGBO(239, 239, 239, 100),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, top: 16),
                          child: Text("Barcode",
                              style: new TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        padding: EdgeInsets.only(
                            left: 12, top: 16, right: 12, bottom: 12),
                        crossAxisCount: 3,
                        children: List.generate(Keys.layanan.length, (index) {
                          return Center(
                              //child: BarcodeScreen();
//                      child: DashboardLayananWidget(layanan: Keys.layanan[index],),
                          );
                        }),
                      ),
                    ],
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 16),
                  child: Text("Berita Terbaru",
                      style:
                      new TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ));
  }
}

