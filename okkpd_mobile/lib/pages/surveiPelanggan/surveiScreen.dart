import 'dart:ui';
import 'package:flutter/material.dart';

class SurveiScreen extends StatefulWidget {
  @override
  _SurveiScreen createState() => _SurveiScreen();
}

class _SurveiScreen extends State<SurveiScreen> {
  List tampilanRate = [
    {'id': 1, 'sts': 'Sangat tidak setuju', 'active': false},
    {'id': 2, 'ts': 'Tidak Setuju', 'active': false},
    {'id': 3, 'n': 'Netral', 'active': false},
    {'id': 4, 's': 'Setuju', 'active': false},
    {'id': 5, 'ss': 'Sangat Setuju', 'active': false}
  ];

  List kecepatanRate = [
    {'id': 1, 'sts': 'Sangat tidak setuju', 'active': false},
    {'id': 2, 'ts': 'Tidak Setuju', 'active': false},
    {'id': 3, 'n': 'Netral', 'active': false},
    {'id': 4, 's': 'Setuju', 'active': false},
    {'id': 5, 'ss': 'Sangat Setuju', 'active': false}
  ];

  List kemudahanRate = [
    {'id': 1, 'sts': 'Sangat tidak setuju', 'active': false},
    {'id': 2, 'ts': 'Tidak Setuju', 'active': false},
    {'id': 3, 'n': 'Netral', 'active': false},
    {'id': 4, 's': 'Setuju', 'active': false},
    {'id': 5, 'ss': 'Sangat Setuju', 'active': false}
  ];

  List kelengkapanRate = [
    {'id': 1, 'sts': 'Sangat tidak setuju', 'active': false},
    {'id': 2, 'ts': 'Tidak Setuju', 'active': false},
    {'id': 3, 'n': 'Netral', 'active': false},
    {'id': 4, 's': 'Setuju', 'active': false},
    {'id': 5, 'ss': 'Sangat Setuju', 'active': false}
  ];

  @override
  Widget build(BuildContext context) {
    final tampilan = Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text('Bagaimana tampilan aplikasi?', textAlign: TextAlign.left),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (var i in tampilanRate) _tampilanStar(i['id']),
                ]),
          ],
        ));

    final kemudahan = Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text('Bagaimana kemudahan menggunakan aplikasi ?',
                textAlign: TextAlign.left),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (var i in kemudahanRate) _kemudahanStar(i['id']),
                ]),
          ],
        ));

    final kelengkapan = Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text('Bagaimana kelengkapan informasi aplikasi ?',
                textAlign: TextAlign.left),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (var i in tampilanRate) _kelengkapanStar(i['id']),
                ]),
          ],
        ));

    final kecepatan = Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text('Bagaimana kecepatan layanan menggunakan aplikasi ?',
                textAlign: TextAlign.left),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (var i in kecepatanRate) _kecepatanStar(i['id']),
                ]),
          ],
        ));

    final komentar = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 25.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: 'Kritik Dan Saran', icon: Icon(Icons.add_comment)),
          ),
        ),
      ],
    );
    return ListView(
      children: <Widget>[
        SizedBox(height: 10.0),
        SingleChildScrollView(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                tampilan,
                kemudahan,
                kelengkapan,
                kecepatan,
                komentar,
              ],
            )),
      ],
    );
  }

  _tampilanStar(int i) {
    return IconButton(
      color: Colors.orange,
      icon: tampilanRate[i - 1]['active'] == true
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
      onPressed: () {
        for (var a = 0; a < tampilanRate.length; a++) {
          if (a < i) {
            print(a);
            tampilanRate[a]['active'] = true;
          } else {
            tampilanRate[a]['active'] = false;
          }
        }
        setState(() {});
      },
    );
  }

  _kemudahanStar(int i) {
    return IconButton(
      color: Colors.orange,
      icon: kemudahanRate[i - 1]['active'] == true
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
      onPressed: () {
        for (var a = 0; a < kemudahanRate.length; a++) {
          if (a < i) {
            print(a);
            kemudahanRate[a]['active'] = true;
          } else {
            kemudahanRate[a]['active'] = false;
          }
        }
        setState(() {});
      },
    );
  }

  _kecepatanStar(int i) {
    return IconButton(
      color: Colors.orange,
      icon: kecepatanRate[i - 1]['active'] == true
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
      onPressed: () {
        for (var a = 0; a < kecepatanRate.length; a++) {
          if (a < i) {
            print(a);
            kecepatanRate[a]['active'] = true;
          } else {
            kecepatanRate[a]['active'] = false;
          }
        }
        setState(() {});
      },
    );
  }

  _kelengkapanStar(int i) {
    return IconButton(
      color: Colors.orange,
      icon: kelengkapanRate[i - 1]['active'] == true
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
      onPressed: () {
        for (var a = 0; a < kelengkapanRate.length; a++) {
          if (a < i) {
            print(a);
            kelengkapanRate[a]['active'] = true;
          } else {
            kelengkapanRate[a]['active'] = false;
          }
        }
        setState(() {});
      },
    );
  }
}
