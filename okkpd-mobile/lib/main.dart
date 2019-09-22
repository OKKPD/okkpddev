import 'package:flutter/material.dart';
import 'package:godek/constants/theme.dart'as theme;
import 'package:godek/pages/home_screen_onepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Godek',
      theme: ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: theme.green,
        accentColor: theme.green,
      ),
      home: HomeScreen(),
    );
  }
} 