import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:okkpd_mobile/model/masterLayananModel.dart';

// class DashboardLayananWidget extends StatefulWidget {
//   @override
//   _DashboardLayananWidgetState createState() => _DashboardLayananWidgetState();
// }

// void _portraitModeOnly() {
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
// }

// class _DashboardLayananWidgetState extends State<DashboardLayananWidget>  {
//   @override
//   Widget build(BuildContext context) {
//     // final TextStyle textStyle = Theme.of(context).textTheme.display1;
//     return _LayananCard();
//   }
// }

class DashboardLayananWidget extends StatelessWidget {
  const DashboardLayananWidget({Key key, this.layanan}) : super(key: key);
  final MasterLayananModel layanan;

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.white,
        child: new InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(layanan.route);
            },
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        layanan.namaLayanan,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]
              ),
            )
        )
    );
  }
}
