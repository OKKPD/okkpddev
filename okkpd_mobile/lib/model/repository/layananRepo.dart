import 'dart:convert';

import 'package:okkpd_mobile/constants/key.dart';
import 'package:http/http.dart' as http;
import 'package:okkpd_mobile/model/layananModel.dart';
import 'package:okkpd_mobile/model/trackLayananModel.dart';
import 'package:okkpd_mobile/model/trackSertifikatModel.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayananRepo {

  Future<String> getIdUsaha() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString('loginidUsaha'));
  }

  Future getLayanan(String kodeLayanan, String status) async {
    if(status == null) {
      status = "%";
    }else if(status == 'Semua'){
      status = '%';
    }else if(status == 'Menunggu'){
      status = '0';
    }else if(status == 'Selesai'){
      status = '1';
    }else if(status == 'Ditolak'){
      status = '2';
    }

    if(kodeLayanan == null){
      kodeLayanan = "%";
    }

    String idUsaha = await getIdUsaha();
    List<LayananModel> _postList = [];
    var url = '${Keys.APIURL}layanan/$idUsaha/list?layanan=$kodeLayanan&status=$status';
    print(url);
    var response = await http.get(url);
    final values = json.decode(response.body);

    if(response.statusCode != 200){
      return  null;
    }else{
      for (int i = 0; i < values['DATA'].length; i++) {
        var sektor = LayananModel.fromJson(values['DATA'][i]);
        _postList.add(sektor);
      }
      return _postList;
    }
  }


  Future trackSertifikat(String kodeTracking) async {
    TrackSertifikatModel _postList ;
    var url = '${Keys.APIURL}tracking/sertifikat';
    var response = await http.post(url,body: {'tracking_data':kodeTracking});
    final values = json.decode(response.body);

    if(response.statusCode != 200){
      return null;
    }else{
      for (int i = 0; i < values['DATA'].length; i++) {
        var data = TrackSertifikatModel.fromJson(values['DATA'][i]);
        _postList = (data);
      }
      return _postList;
    }
  }

  Future trackLayanan(String kodeTracking) async {
    List<TrackLayananModel> _postList = [];
    var url = '${Keys
        .APIURL}tracking/layanan';
    var response = await http.post(url,body: {'tracking_data':kodeTracking});
    final values = json.decode(response.body);
    print(url);

    if(response.statusCode != 200){
      FunctionDart().setToast(values['MESSAGE']);
      return null;
    }else{
      for (int i = 0; i < values['DATA'].length; i++) {
        var sektor = TrackLayananModel.fromJson(values['DATA'][i]);
        _postList.add(sektor);
      }
      return _postList;
    }
  }

  Future<bool> simpanLayanan(String kodeLayanan) async {

    String idUsaha = await getIdUsaha();
    var url = '${Keys
        .APIURL}layanan/$idUsaha/simpan_dokumen';
    var response = await http.post(url,
        body: {'id_layanan': kodeLayanan});
    final values = json.decode(response.body);
    FunctionDart().setToast(values['MESSAGE']);

    if(response.statusCode != 200){
      return Future.value(false);
    }else{
      return Future.value(true);

    }
  }
}

//  Future getLayanan(String kodeLayanan, String status) async {
//    String idUsaha = await getIdUsaha();
//    List<LayananModel> _listLayanan = [];
//    var url = '${Keys.APIURL}layanan/$idUsaha/list?layanan=$kodeLayanan&status=$status';
//    var response = await http.get(url);
//    var resp = ResponseModel.fromJson(json.decode(response.body));
//
//    print(url);
//
//    if(response.statusCode != 200){
//      FunctionDart().setToast("Ups! Ada kendala pada server.");
//      return Future.value(null);
//    }else{
//      for (int i = 0; i < resp.data.length; i++) {
//        var layanan = LayananModel.fromJson(resp.data[i]);
//        _listLayanan.add(layanan);
//      }
//
//      return Future.value(_listLayanan);
//    }
//  }

//}