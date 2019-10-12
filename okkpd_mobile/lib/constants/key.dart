
import 'package:okkpd_mobile/model/masterLayananModel.dart';

class Keys {
  static const String APIURL = "http://yogaadi.xyz/okkpd_api/public/api/v1/";
  
  static const List<MasterLayananModel> layanan = const <MasterLayananModel>[
    const MasterLayananModel("hc", "Health Certificate","/hcscreen"),
    const MasterLayananModel("kemas", "Rumah Kemas","/rumahKemas"),
    const MasterLayananModel("prima_2", "Prima 2","/primaDuascreen"),
    const MasterLayananModel("prima_3", "Prima 3","/primaTigascreen"),
    const MasterLayananModel("psat", "PSAT","/psatscreen"),
  ];
}