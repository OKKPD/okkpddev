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



class _GuestScreen extends State<GuestScreen> {
  String  _barcodeScanRes,_scanBarcode;
  Future scanBarcodeNormal() async {
    String ;


    _barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE);
   // print(barcodeScanRes);

    setState(() {
      _scanBarcode = _barcodeScanRes;
    });
  }

  Future _dataScan(){
    if(_barcodeScanRes != null){
      print(_scanBarcode);
    }else{
      print("-");
    }

  }
  
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scan Sertifikat',
            ),
//            Text(
//             _scanBarcode,
//              style: Theme.of(context).textTheme.display1,
//            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanBarcodeNormal,
        tooltip: 'Increment',
        child: Icon(Icons.settings_overscan),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

