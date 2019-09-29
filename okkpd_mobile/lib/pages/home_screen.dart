import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:okkpd_mobile/pages/dashboard_screen.dart';
import 'package:okkpd_mobile/pages/user_screen.dart';
import 'package:okkpd_mobile/pages/profil_usaha_screen.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final widgetOptions = [
    DashboardScreen(),
    Text('Activity'),
    Text('Media'),
    ProfilUsahaScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.track_changes), title: Text('Track')),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_media), title: Text('Media')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text('Usaha')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text('User')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
