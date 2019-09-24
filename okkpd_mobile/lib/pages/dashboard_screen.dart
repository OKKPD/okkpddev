import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

final header = Container(
  padding: EdgeInsets.all(12),
  decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xdfe6e9),
          Color(0xdfe6e9)
        ],
      ),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: <Widget>[
      Text(
        "OKKPD JATENG",
        style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontFamily: "NeoSansBold"),
      ),

      //ini buat tulisan saldo, dengan pakai container
      //coba, apa bedanya?
      IconButton(
        icon: Icon(Icons.notifications),
        color: Colors.black54,
        onPressed: () {

        },
      ),
    ],
  ),
);

final prima2 = Card(
  child: new InkWell(
    onTap: () {
      print("tapped");
    },
    child: Container(
      width: 114.0,
      height: 114.0,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 9.0 / 5.5,
            child: Image.asset('assets/logo.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Center(
                child: new Text(
                  "Prima 2",
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ],
      ),
    ),
  ),
);

final prima3 = Card(
  child: new InkWell(
    onTap: () {
      print("tapped");
    },
    child: Container(
      width: 114.0,
      height: 114.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 9.0 / 5.5,
            child: Image.asset('assets/logo.png'),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Center(
                child: new Text(
                  "Prima 3",
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ],
      ),
    ),
  ),
);

final psat = Card(
  child: new InkWell(
    onTap: () {
      print("tapped");
    },
    child: Container(
      width: 114.0,
      height: 114.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 9.0 / 5.5,
            child: Image.asset('assets/logo.png'),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Center(
                child: new Text(
                  "PSAT",
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ],
      ),
    ),
  ),
);

final rumahKemas = Card(
  child: new InkWell(
    onTap: () {
      print("tapped");
    },
    child: Container(
      width: 114.0,
      height: 114.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 9.0 / 5.5,
            child: Image.asset('assets/logo.png'),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Center(
                child: new Text(
                  "Rumah Kemas",
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ],
      ),
    ),
  ),
);


final hc = Card(
  child: new InkWell(
    onTap: () {
      print("tapped");
    },
    child: Container(
      width: 114.0,
      height: 114.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 9.0 / 5.5,
            child: Image.asset('assets/logo.png'),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Center(
                child: new Text(
                  "HC",
                  textAlign: TextAlign.center,
                ),
              )
          ),
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
        aspectRatio: 9.0 / 5.5,
        child: Image.asset('assets/user.png'),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Informasi udate'),
            SizedBox(height: 2.0),
            Text('isi informasi'),
          ],
        ),
      ),
    ],
  ),
);


void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            header,
            layanan,
            informasi,
          ],
        ),
      ),
    );
  }
}
