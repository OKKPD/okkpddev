import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class InfoUsahaScreen extends StatefulWidget {
  @override
  _InfoUsahaScreen createState() => _InfoUsahaScreen();
}

class _InfoUsahaScreen extends State<InfoUsahaScreen> {
  ProgressDialog pr;
  String namaUsaha = "Nama usahanya apa";
  String alamatUsaha = "Jl. Cungkup no 492 Salatiga";
  String namaPemohon = "Yoga Adi Dharma";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top:16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Informasi Usaha", style: TextStyle(fontSize: 18,color: Colors.black54,fontFamily: "NeoSansBold"),),
          SizedBox(height: 24.0),
          TextDetailWidget(title: "Informasi Usaha",content: "$namaUsaha",),
          TextDetailWidget(title: "Alamat",content: "$alamatUsaha",),
          TextDetailWidget(title: "Nama Pemohon",content: "$namaPemohon",),
          Divider(color: Colors.grey,),
        ],
      ),
    ); 
  }
}

class TextDetailWidget extends StatelessWidget {
  const TextDetailWidget({Key key, this.title, this.content}) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$title", style: TextStyle(fontSize: 12,color: Colors.black45,fontFamily: "NeoSansBold"),),
        SizedBox(height: 8.0),
        Text("$content", style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: "NeoSansBold"),),
        SizedBox(height: 16.0),
      ],
    );
  }
}
