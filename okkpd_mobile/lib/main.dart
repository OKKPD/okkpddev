import 'package:flutter/material.dart';
import 'package:okkpd_mobile/constants/theme.dart'as theme;
import 'package:okkpd_mobile/pages/home_screen.dart';
import 'package:okkpd_mobile/pages/login_screen.dart';
import 'package:okkpd_mobile/pages/dashboard_screen.dart';
import 'package:okkpd_mobile/pages/psat_screen.dart';
import 'package:okkpd_mobile/pages/hc_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OKKPS',
      theme: ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: theme.menuBluebird,
        accentColor: theme.menuBluebird,
      ),
      home: LoginScreen(),



          routes: <String, WidgetBuilder> {
            '/login': (BuildContext context) => new LoginScreen(),
            '/homescreen' : (BuildContext context) => new HomeScreen(),
            '/hcscreen' : (BuildContext context) => new Hcscreen(),
            '/psatscreen' : (BuildContext context) => new Psatscreen()
          },

    );
  }
}