import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:okkpd_mobile/constants/key.dart';
import 'package:http/http.dart' as http;
import 'package:okkpd_mobile/model/mediaModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MediaRepo {
  Future<String> getIdUsaha() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString('loginidUsaha'));
  }

  Future<String> getIdUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString('loginId'));
  }

  Future getMedia(String kodeLayanan, String jenis) async {
    String idUsaha = await getIdUsaha();
    List<MediaModel> _postList = [];
    var url = '${Keys.APIURL}layanan/$idUsaha/dokumen/$kodeLayanan/$jenis';
    print(url);
    var response = await http.get(url);
    final values = await json.decode(response.body);

    if (response.statusCode != 200) {
      return null;
    } else {
      for (int i = 0; i < values['DATA'].length; i++) {
        var sektor = MediaModel.fromJson(values['DATA'][i]);
        _postList.add(sektor);
      }
      return _postList;
    }
  }

  Future getMediaById(String kodeDokumen) async {
    List<MediaModel> _postList = [];
    String idUser = await getIdUser();
    var url = '${Keys.APIURL}layanan/$idUser/dokumen/$kodeDokumen';
    print(url);
    var response = await http.get(url);
    final values = await json.decode(response.body);

    if (response.statusCode != 200) {
      return null;
    } else {
      for (int i = 0; i < values['DATA'].length; i++) {
        var sektor = MediaModel.fromJson(values['DATA'][i]);
        _postList.add(sektor);
      }
      return _postList;
    }
  }

  Future getStatusDokumen() async {
    String idUser = await getIdUser();
    var url = '${Keys.APIURL}user/$idUser/dokumen_media';
    print(url);

    var response = await http.get(url);
    final values = await json.decode(response.body);

    List<MediaModel> _postList = [];

    if (response.statusCode != 200) {
      return null;
    } else {
      for (int i = 0; i < values['DATA'].length; i++) {
        var sektor = MediaModel.fromJson(values['DATA'][i]);
        _postList.add(sektor);
      }
      print(_postList);
      return _postList;
    }
  }

  Future<bool> uploadMedia(File dokumen, String kodeDokumen) async {
    Response response;
    Dio dio = new Dio();

    String idUsaha = await getIdUsaha();
    String idUser = await getIdUser();
    List<String> nama = dokumen.path.split("/");
    var url = '${Keys.APIURL}layanan/$idUsaha/unggah_media';

    FormData formData = FormData.fromMap({
      "kode_dokumen": kodeDokumen,
      "id_user": idUser,
      "gambar": await MultipartFile.fromFile(dokumen.path,
          filename: nama[nama.length - 1])
    });
    response = await dio.post(url, data: formData);

    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
