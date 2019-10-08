
import 'package:okkpd_mobile/model/layanan_model.dart';

class Keys {
  static const String APIURL = "http://yogaadi.xyz/okkpd_api/public/api/v1/";
  
  static const List<LayananModel> layanan = const <LayananModel>[
    const LayananModel("hc", "Health Certificate","/hcsreen"),
    const LayananModel("kemas", "Rumah Kemas","/rumahKemas"),
    const LayananModel("prima_2", "Prima 2","/primaDuascreen"),
    const LayananModel("prima_3", "Prima 3","/primaTigascreen"),
    const LayananModel("psat", "PSAT","/psatscreen"),
  ];
}