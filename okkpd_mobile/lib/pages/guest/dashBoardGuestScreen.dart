import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/guest/trackingStatusScreen.dart';

class DashboarGuestScreen extends StatefulWidget {
  @override
  _DashboarGuestScreen createState() => _DashboarGuestScreen();
}

class _DashboarGuestScreen extends State<DashboarGuestScreen> {

  var _kodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final kodeRegistrasi= Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Container(
            width: 200,
            height: 100,
              alignment: AlignmentDirectional(2.0, 0.0),
            child: Image(image: AssetImage('assets/logo.png'))
          ),
//          Container(
//              width: 50,
//              height: 50,
//              alignment: Alignment.center,
//              child: Image(image: AssetImage('assets/titik.png'))
//          ),

          Container(
            alignment: Alignment.center,
            child: new Text('Traking Layanan Anda',
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0),),
          ),

          new Padding(padding: EdgeInsets.only(top: 20.0)),
          TextFormField(
            controller: _kodeController,
            decoration: new InputDecoration(
              labelText: "Kode Registrasi Layanan",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(8.0),
                borderSide: new BorderSide(
                ),
              ),
              //fillColor: Colors.green
            ),
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "NeoSansBold",
            ),
          ),
        ]
    );

    final saveButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrackingStatusScreen(_kodeController.text)),
            );
          },
          color: Colors.blue,
          child: Text('Cari', style: TextStyle(color: Colors.white, fontSize: 20.0)),

        ),
      ),
    );


//    final beritaScreen = Container(
//
//    );

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    final beritaScreen =
    FutureBuilder(builder: (BuildContext context, AsyncSnapshot res) {
      var data = [
        {'Track': 'Berita', 'Status': 'Diterima'},

      ];

      final children = <Widget>[];
      for (var datas in data) {
        children.add(new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: new InkWell(
            onTap: () {
              print("tapped");
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: queryData.size.width / 3,
                        child: Text(
                          datas['Track'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "NeoSansBold"),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: new Divider(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipicing elit,",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: "NeoSansBold"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
      }
      return new Column(
        children: children,
      );
    });

//    _portraitModeOnly();
    return Scaffold(
        backgroundColor: Colors.white,
//        appBar: AppBar(
//        title: Text("",style: TextStyle(color: Colors.white)),
//    ),
    body: Center(
      child: ListView(
       padding: EdgeInsets.only(left: 30.0, right: 30.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            kodeRegistrasi,
            saveButton ,
            SizedBox(height: 48.0),
            beritaScreen,
            SizedBox(height: 58.0),
                      ],
                ),
              ),
            );
      }
  }

