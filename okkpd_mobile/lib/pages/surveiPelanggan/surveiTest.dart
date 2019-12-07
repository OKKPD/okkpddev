import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:okkpd_mobile/pages/homeScreen.dart';

class SurveiTest extends StatefulWidget {
  @override
  _SurveiTest createState() => _SurveiTest();
}

class _SurveiTest extends State<SurveiTest> {
  var _tampilanCont = TextEditingController();
  var _kemudahanCont = TextEditingController();
  var _kelengkapanCont = TextEditingController();
  var _kecepatanCont = TextEditingController();

  List _Gambar = [
    {'id': 1, 'sts': 'Sangat tidak setuju', 'active': false},
    {'id': 2, 'ts': 'Tidak Setuju', 'active': false},
    {'id': 3, 'n': 'Netral', 'active': true},
    {'id': 4, 's': 'Setuju', 'active': false},
    {'id': 5, 'ss': 'Sangat Setuju', 'active': false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Back", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  color: Color.fromRGBO(239, 239, 239, 100),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                            verticalInside: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                          ),
                          children: [
                            _buildTableRow("Bagaimana tampilan aplikasi ?, "),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (var i in _Gambar) _buildSuggestions(i['id']),
                          ]),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                            verticalInside: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                          ),
                          children: [
                            _buildTableRow(
                                "Bagaimana kemudahan penggunaan aplikasi ?, "),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (var q in _Gambar) _buildSuggestions2(q['id']),
                          ]),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                            verticalInside: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                          ),
                          children: [
                            _buildTableRow(
                                "Bagaimana kelengkapan informasi aplikasi ?, "),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (var i in _Gambar) _buildSuggestions(i['id']),
                          ]),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                            verticalInside: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                          ),
                          children: [
                            _buildTableRow(
                                "Bagaimana kecepatan layanan menggunakan aplikasi ?, "),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (var i in _Gambar) _buildSuggestions(i['id']),
                          ]),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 25.0),
                      child: TextFormField(
                        //controller: _textEditConName,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        //validator: _validateUserName,
//                          onFieldSubmitted: (String value) {
//                            FocusScope.of(context).requestFocus(_passwordEmail);
//                          },
                        decoration: InputDecoration(
                            labelText: 'Kritik Dan Saran',
                            icon: Icon(Icons.add_comment)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 42.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen('0')),
                      );
                    },
                    color: Colors.lightBlueAccent,
                    child: Text('Kirim',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  TableRow _buildTableRow(String listOfNames) {
    return TableRow(
      children: listOfNames.split(',').map((name) {
        return Container(
          alignment: Alignment.topLeft,
          child: Text(name, style: TextStyle(fontSize: 16.0)),
          padding: EdgeInsets.all(0.0),
        );
      }).toList(),
    );
  }

  _buildSuggestions(int i) {
//    for (var i = 0; i < 5; i++) {
    return IconButton(
      color: Colors.orange,
      icon: _Gambar[i - 1]['active'] == true
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
      tooltip: 'Increase volume by 10',
      onPressed: () {
        for (var a = 0; a < _Gambar.length; a++) {
          if (a < i) {
            _Gambar[a]['active'] = true;
          } else {
            _Gambar[a]['active'] = false;
          }
        }
        setState(() {});
      },
    );
//    }
  }

  _buildSuggestions2(int q) {
//    for (var i = 0; i < 5; i++) {
    return IconButton(
      color: Colors.orange,
      icon: _Gambar[q - 1]['active'] == true
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
      tooltip: 'Increase volume by 10',
      onPressed: () {
        for (var a = 0; a < _Gambar.length; a++) {
          if (a < q) {
            _Gambar[a]['active'] = true;
          } else {
            _Gambar[a]['active'] = false;
          }
        }
        setState(() {});
      },
    );
//    }
  }
}
