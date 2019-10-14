import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:okkpd_mobile/constants/key.dart';
import 'package:okkpd_mobile/pages/dashboard/dashboarLayananWidget.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    _portraitModeOnly();
    final informasi = Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: Image.asset('assets/user.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Informasi update'),
                SizedBox(height: 2.0),
                Text('isi informasi'),
              ],
            ),
          ),
        ],
      ),
    );

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
                      child: Text("Layanan",
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
                        child: DashboardLayananWidget(layanan: Keys.layanan[index],),
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

