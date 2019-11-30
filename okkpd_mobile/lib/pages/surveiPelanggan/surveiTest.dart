import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    {'id': 1, 'sts': 'Sangat tidak setuju', 'active':false},
    {'id': 2, 'ts': 'Tidak Setuju', 'active':false},
    {'id': 3, 'n': 'Netral', 'active':true},
    {'id': 4, 's': 'Setuju', 'active':false},
    {'id': 5, 'ss': 'Sangat Setuju', 'active':false}
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                            _buildTableRow("Bagaimana kemudahan penggunaan aplikasi ?, "),
                            _buildTableRow("Bagaimana kelengkapan informasi aplikasi ?, "),
                            _buildTableRow("Bagaimana kecepatan layanan menggunakan aplikasi ?, "),

                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[


                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 25.0),

                    ),
                  ],
                ),
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for ( var i in _Gambar ) _buildSuggestions(i['id']),

                  ]

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
          child: Text(name, style: TextStyle(fontSize: 10.0)),
          padding: EdgeInsets.all(16.0),
        );
      }).toList(),
    );
  }


  _buildSuggestions(int i) {
//    for (var i = 0; i < 5; i++) {
      print(_Gambar[i-1]);
      return IconButton(
        color: Colors.orange ,
        icon: _Gambar[i-1]['active']==true?Icon(Icons.star):Icon(Icons.star_border),
        tooltip: 'Increase volume by 10',
        onPressed: () {
          for(var a=0; a<_Gambar.length; a++) {
            if(a<i){
              _Gambar[a]['active'] = true;
            }else{
              _Gambar[a]['active'] = false;
            }
          }
          setState(() {

          });
        },
      );
//    }
  }
}
