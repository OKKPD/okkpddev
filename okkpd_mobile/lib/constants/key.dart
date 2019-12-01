
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/MenuModel.dart';
import 'package:okkpd_mobile/model/masterLayananModel.dart';

class Keys {
  static const String APIURL = "http://yogaadi.xyz/okkpd_api/public/api/v1/";
//  static const String APIURL = "http://192.168.1.109:8081/api/v1/";

  static const List<MasterLayananModel> layanan = const <MasterLayananModel>[
    const MasterLayananModel("hc", "Health Certificate","/hcscreen"),
    const MasterLayananModel("kemas", "Rumah Kemas","/rumahKemas"),
    const MasterLayananModel("prima_2", "Prima 2","/primaDuascreen"),
    const MasterLayananModel("prima_3", "Prima 3","/primaTigascreen"),
    const MasterLayananModel("psat", "PSAT","/psatscreen"),
  ];

  static const List<MenuModel> menuManagerAdmin = const <MenuModel>[
    const MenuModel("Layanan Diterima","/layananDiterima",Icons.file_download),
    const MenuModel("Layanan Ditolak","/hcscreen",Icons.close),
  ];
  //==== Theme ====

  //Font Size
  final normalFontSize = const TextStyle(fontSize: 14.0);
  final bigBoldFontSiza = const TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold);
  final mediumBoldFontSize = const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold);
  final smallFontSize = const TextStyle(fontSize: 12.0);

  //==== Theme End ====
}