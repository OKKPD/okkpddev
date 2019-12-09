import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/MenuModel.dart';
import 'package:okkpd_mobile/model/masterLayananModel.dart';

class Keys {
  static const String APIURL = "http://yogaadi.xyz/okkpd_api/public/api/v1/";
//  static const String APIURL = "http://192.168.1.109:8081/api/v1/";

  static const List<MasterLayananModel> layanan = const <MasterLayananModel>[
    const MasterLayananModel(
        "hc", "HEALTH CERTIFICATE", "/hcscreen", "assets/hc.jpeg"),
    const MasterLayananModel(
        "kemas", "RUMAH KEMAS", "/rumahKemas", "assets/kemas.jpeg"),
    const MasterLayananModel(
        "prima_2", "PRIMA 2", "/primaDuascreen", "assets/p2.jpeg"),
    const MasterLayananModel(
        "prima_3", "PRIMA 3", "/primaTigascreen", "assets/p3.jpeg"),
    const MasterLayananModel("psat", "PSAT", "/psatscreen", "assets/psat.jpeg"),
  ];

  static const List<MenuModel> menuManagerAdmin = const <MenuModel>[
    const MenuModel("Layanan Diterima", "/layananDiterima",
        AssetImage('assets/accepted.png')),
    const MenuModel(
        "Layanan Ditolak", "/hcscreen", AssetImage('assets/rejected.png')),
  ];
  //==== Theme ====

  //Font Size
  final normalFontSize = const TextStyle(fontSize: 14.0);
  final bigBoldFontSiza =
      const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
  final mediumBoldFontSize =
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  final smallFontSize = const TextStyle(fontSize: 12.0);

  //==== Theme End ====
}
