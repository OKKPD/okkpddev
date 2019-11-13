import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:okkpd_mobile/constants/key.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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


//void _getDatascan(){
//  if(_barcodeScanRes == null){
//    print("data kosong");
//  }else if(_barcodeScanRes != null){
//    print("Data");
//  }
//}




class _GuestScreen extends State<GuestScreen> {
  String  _barcodeScanRes,_scanBarcode;


  Future scanBarcodeNormal() async {
    _barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
   if(_barcodeScanRes != "") {
    // print(_barcodeScanRes);

     setState(() {
       _scanBarcode = _barcodeScanRes;
    });
   }else{

    // print(_barcodeScanRes);

//     setState(() {
//       _scanBarcode = "Data kosong";
//     });
   }
  }


  
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
                          child: Text("Data",
                              style: new TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                          width: 300,
                          height: 200,
                      ),

                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 250,
                            child: Text(
                              "Scan Sertifikat",
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
                    onPressed: scanBarcodeNormal,
                    color: Colors.blue,
                    child: Text('Scan Sertifikat', style: TextStyle(color: Colors.white, fontSize: 20.0)),

                  ),
                ),
              ),


            ],
          ),
        ));
  }
}

