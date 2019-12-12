import 'dart:io';

import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/layananModel.dart';
import 'package:okkpd_mobile/model/repository/SharedPrefRepo.dart';
import 'package:okkpd_mobile/pages/layanan/infoUsahaScreen.dart';

import '../../tools/GlobalFunction.dart';

class DetailUsahaScreen extends StatefulWidget {
  final LayananModel layanan;
  DetailUsahaScreen(this.layanan);

  @override
  _DetailUsahaScreen createState() => _DetailUsahaScreen(this.layanan);
}

class _DetailUsahaScreen extends State<DetailUsahaScreen> {
  final LayananModel layanan;
  _DetailUsahaScreen(this.layanan);

  String myRole;

  @override
  void initState() {
    super.initState();
    getRole();
  }

  void getRole() async{
    String role = await SharedPrefRepo().getRole();
    setState(() {
      myRole = role;
    });
  }

  Widget contentUser(){
    String pelaksana = layanan.pelaksana;
    String inspektor = layanan.inspektor;
    String ppc = layanan.ppc;

    if(layanan.pelaksana == null){
      pelaksana = "-";
    }
    if(layanan.inspektor == null){
      inspektor = "-";
    }
    if(layanan.ppc == null){
      ppc = "-";
    }

    if(myRole == 'm_teknis'){
      return Container(
        alignment:Alignment.centerLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Informasi Petugas",  style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),),
            SizedBox(height: 16,),
            Text("Inspektor : ${inspektor}"),
            SizedBox(height: 16,),
            Text("Pelaksana : ${pelaksana}"),
            SizedBox(height: 16,),
            Text("PPC : ${ppc}"),
          ],
        ),
      );
    }else if(myRole == 'inspektor'  || myRole == 'pelaksana' || myRole == 'ppc'){
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Unduh Surat Tugas",  style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),),
            SizedBox(height: 16,),
            Container(
              width: double.infinity,
              child: Material(
                child: MaterialButton(
                  height: 42.0,
                  onPressed: () {
                    String url = "http://yogaadi.xyz/okkpd/upload/Dokumen_Usaha/${layanan.namaUsaha}/${layanan.kodePendaftaran}/${layanan.suratTugas}";
                    unduh(url, layanan.suratTugas);
                  },
                  color: Colors.lightBlueAccent,
                  child: Text('Unduh',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],

        ),
      );

    }else{
      return Text("");
    }
  }

  void unduh(String url, String filename) async{

    FunctionDart().setToast("Masih belum bisa download");
//    var permissions = await Permission.getPermissionsStatus([PermissionName.Storage, PermissionName.Storage]);

//    Permission.openSettings;

//    HttpClient client = new HttpClient();
//    client.getUrl(Uri.parse(url))
//        .then((HttpClientRequest request) {
//      return request.close();
//    })
//        .then((HttpClientResponse response) {
//      response.pipe(new File('./${filename}').openWrite());
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FunctionDart.setAppBar("Detail Usaha"),
      body: Container(
        child: Column(
          children: <Widget>[
            InfoUsahaScreen(layanan.idUSer),
            Divider(),
            contentUser(),
          ],
        ),
      ),
    );
  }
}
