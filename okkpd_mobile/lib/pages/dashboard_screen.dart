import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          Color(0xff3164bd),
          Color(0xff295cb5)
        ],
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3),
          topRight: Radius.circular(3))),

  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[

      //nha ini buat tulisan GOPAY
      Text(
        "OKKPD JATENG",
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
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

final informasi = Card(
  clipBehavior: Clip.antiAlias,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      AspectRatio(
        aspectRatio: 9.0 / 5.5,
        child: Image.asset('assets/logo.png'),
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


final prima2 = Container(
  child: FlatButton.icon(
    icon: Icon(Icons.add_a_photo), //`Icon` to display
    onPressed: () {
      //Code to execute when Floating Action Button is clicked
      //...
    },
  ),
);

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            header,
            informasi,
          ],
        ),
      ),
    );
  }
}
