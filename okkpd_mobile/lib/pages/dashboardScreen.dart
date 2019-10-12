import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:okkpd_mobile/constants/key.dart';
import 'package:okkpd_mobile/model/masterLayananModel.dart';

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
    final header = Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "OKKPD JATENG",
            style: TextStyle(
                fontSize: 18, color: Colors.black54, fontFamily: "NeoSansBold"),
          ),

          //ini buat tulisan saldo, dengan pakai container
          //coba, apa bedanya?
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.black54,
            onPressed: () {},
          ),
        ],
      ),
    );

    final prima2 = Card(
      child: new InkWell(
        onTap: () {
          print("tapped");
          Navigator.of(context).pushNamed('/primaDuascreen');
        },
        child: Container(
          width: queryData.size.width / 3.7,
          height: queryData.size.height / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Center(
                    child: new Text(
                      "Prima 2",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

    final prima3 = Card(
      child: new InkWell(
        onTap: () {
          print("tapped");
          Navigator.of(context).pushNamed('/primaTigascreen');
        },
        child: Container(
          width: queryData.size.width / 3.7,
          height: queryData.size.height / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Center(
                    child: new Text(
                      "Prima 3",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

    final psat = Card(
      child: new InkWell(
        onTap: () {
          print("tapped");
          Navigator.of(context).pushNamed('/psatscreen');
        },
        child: Container(
          width: queryData.size.width / 3.7,
          height: queryData.size.height / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Center(
                    child: new Text(
                      "PSAT",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

    final rumahKemas = Card(
      child: new InkWell(
        onTap: () {
          print("tapped");
          Navigator.of(context).pushNamed('/rumahKemas');
        },
        child: Container(
          width: queryData.size.width / 3.7,
          height: queryData.size.height / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Center(
                    child: new Text(
                      "Rumah Kemas",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

    final hc = Card(
      child: new InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/hcscreen');
          print("tapped");
        },
        child: Container(
          width: queryData.size.width / 3.7,
          height: queryData.size.height / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Center(
                    child: new Text(
                      "HC",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

    final layanan = Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
            child: Row(
              children: <Widget>[
                prima3,
                prima2,
                psat,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
            child: Row(
              children: <Widget>[
                rumahKemas,
                hc,
              ],
            ),
          ),
        ],
      ),
    );

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
                        child: LayananCard(layanan: Keys.layanan[index]),
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

class LayananCard extends StatelessWidget {
  const LayananCard({Key key, this.layanan}) : super(key: key);
  final MasterLayananModel layanan;

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.white,
        child: new InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(layanan.route);
            },
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        layanan.namaLayanan,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
            )));
  }
}
