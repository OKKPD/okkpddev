import 'package:flutter/material.dart';
import 'package:okkpd_mobile/constants/key.dart';
import 'package:okkpd_mobile/model/beritaModel.dart';
import 'package:okkpd_mobile/model/repository/beritaRepo.dart';

class BeritaScreen extends StatefulWidget {
  String idBerita;
  BeritaScreen(this.idBerita);

  @override
  _BeritaScreen createState() => _BeritaScreen(idBerita);
}

class _BeritaScreen extends State<BeritaScreen> {
  String idBerita;
  _BeritaScreen(this.idBerita);
  BeritaModel berita = new BeritaModel("", "", "", "", "", "", "");


  @override
  void initState() {
    super.initState();
    getBerita();
  }

  void getBerita() async{
    BeritaModel beritas = await BeritaRepo().viewBerita(idBerita);
    setState(() {
      berita = beritas;
    });
  }

  Widget viewBerita(){
    return CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(berita.judulBerita,style: Keys().mediumBoldFontSize,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          berita.tanggalBuat,
                          style: Keys().smallFontSize,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Divider(height: 1,),
                      SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          berita.isiBerita,
                          style: Keys().normalFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ])
          )]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(elevation: 3,title: Text("Berita"),),
      body: viewBerita(),

    );
  }
}
