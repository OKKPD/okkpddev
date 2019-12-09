import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/surveiPelanggan/surveiScreen.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';

class SurveiWidget extends StatefulWidget {
  @override
  _SurveiWidget createState() => _SurveiWidget();
}

class _SurveiWidget extends State<SurveiWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FunctionDart.setAppBar("Survey Kepuasan"),
        body: SurveiScreen());
  }
}
