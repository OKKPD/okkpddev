import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScreen extends StatefulWidget {
  @override
  _QrScreen createState() => _QrScreen();
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class _QrScreen extends State<QrScreen> {
  String barcodeScanRes, scanBarcode;

  Future scanBarcodeNormal() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE);

    setState(() {
      scanBarcode = barcodeScanRes;
    });
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

            FloatingActionButton(
              onPressed: scanBarcodeNormal,
              tooltip: 'Increment',
              child: Icon(Icons.settings_overscan),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
