import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:okkpd_mobile/model/repository/userRepo.dart';
import 'package:okkpd_mobile/pages/dashboard/dashboardScreen.dart';
import 'package:okkpd_mobile/pages/dashboard/notifikasiScreen.dart';
import 'package:okkpd_mobile/pages/user/userScreen.dart';
import 'package:okkpd_mobile/pages/profilUsaha/profilUsahaScreen.dart';
import 'package:okkpd_mobile/pages/status/statusScreen.dart';
import 'package:okkpd_mobile/pages/media/mediaScreen.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appBarTitle = "OKKPD Jateng";

  int totalNotif = 0;

  int selectedIndex = 0;
  final widgetOptions = [
    DashboardScreen(),
    StatusScreen(),
    Mediascreen(),
    ProfilUsahaScreen(),
    UserScreen()
  ];

  @override
  void initState() {
    super.initState();
    getNotif();
  }

  void getNotif() async {
    Future<int> total = UserRepo().countNotifikasi();
    if (await total > 0) {
      setState(() {
        totalNotif = 2;
      });
    } else {
      setState(() {
        totalNotif = 0;
      });
    }
  }

  Widget notifIcon() {
    if (totalNotif > 0) {
      return new IconButton(
        icon: new Icon(Icons.notifications_active),
        color: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotifikasiScreen()),
          );
        },
      );
    } else {
      return new IconButton(
        icon: new Icon(Icons.notifications),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotifikasiScreen()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: AppBar(
          elevation: 3,
          iconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 87)),
          backgroundColor: Colors.white,
          actions: <Widget>[
            notifIcon(),
          ],
          leading: new Container(),
          title: Text(appBarTitle, style: TextStyle(color: Colors.black87)),
          centerTitle: true,
        ),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Beranda')),
            BottomNavigationBarItem(
                icon: Icon(Icons.track_changes), title: Text('Track')),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_media), title: Text('Media')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), title: Text('Usaha')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), title: Text('Akun')),
          ],
          currentIndex: selectedIndex,
          fixedColor: Colors.blue,
          onTap: onItemTapped,
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    getNotif();
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        appBarTitle = "OKKPD Jateng";
      } else if (index == 1) {
        appBarTitle = "Status Layanan";
      } else if (index == 2) {
        appBarTitle = "Media";
      } else if (index == 3) {
        appBarTitle = "Identitas Usaha";
      } else if (index == 4) {
        appBarTitle = "Profil Akun";
      }
    });
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Keluar Aplikasi'),
            content: new Text('Apakah anda ingin keluar aplikasi?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Tidak'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Ya'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
