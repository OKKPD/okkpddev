import 'dart:async';

import 'package:flutter/material.dart';
import 'package:okkpd_mobile/constants/theme.dart'as theme;
import 'package:okkpd_mobile/pages/home_screen.dart';
import 'package:okkpd_mobile/pages/login_screen.dart';
import 'package:okkpd_mobile/pages/primaTiga_screen.dart';
import 'package:okkpd_mobile/pages/psat_screen.dart';
import 'package:okkpd_mobile/pages/hc_screen.dart';
import 'package:okkpd_mobile/pages/primaDua_screen.dart';
import 'package:okkpd_mobile/pages/rumahKemas_screen.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OKKPD',
      theme: ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: theme.menuBluebird,
        accentColor: theme.menuBluebird,
      ),
      home: SplashScreen(),

          routes: <String, WidgetBuilder> {
            '/login': (BuildContext context) => new LoginScreen(),
            '/homescreen' : (BuildContext context) => new HomeScreen(),
            '/hcscreen' : (BuildContext context) => new Hcscreen(),
            '/psatscreen' : (BuildContext context) => new Psatscreen(),
            '/primaDuascreen' : (BuildContext context) => new PrimaduaScreen(),
            '/primaTigascreen' : (BuildContext context) => new PrimatigaScreen(),
            '/rumahKemas' : (BuildContext context) => new Rumahkemas(),

          },

    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("loginId") != null){
      Navigator.of(context).pushReplacementNamed('/homescreen');
    }else{
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/logo.png'),
      ),
    );
  }
}