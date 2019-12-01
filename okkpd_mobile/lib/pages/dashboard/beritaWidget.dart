import 'package:flutter/material.dart';
import 'package:okkpd_mobile/constants/key.dart';
import 'package:okkpd_mobile/model/beritaModel.dart';
import 'package:okkpd_mobile/model/repository/beritaRepo.dart';
import 'package:okkpd_mobile/pages/dashboard/beritaScreen.dart';
import 'package:okkpd_mobile/tools/CustomWidget.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';

class BeritaWidget extends StatefulWidget {
  @override
  _BeritaWidget createState() => _BeritaWidget();
}

class _BeritaWidget extends State<BeritaWidget> {
  final List<BeritaModel> berita = [];
  bool isLoading = true;
  var haveData = true;

  @override
  void initState() {
    super.initState();
    getPrevBerita();
  }

  void getPrevBerita() async {
    List<BeritaModel> beritas = await BeritaRepo().getPreview();
    setState(() {
      if(beritas.length < 1){
        haveData = false;
      }else{
        haveData = true;
        berita.addAll(beritas);
      }
      isLoading = false;
    });

    if (beritas.length > 0) {
      isLoading = false;
    }
  }

  _buildSuggestions() {
//    return (isLoading)
//        ? Center(child: const CircularProgressIndicator())
//        : ListView.builder(
//            shrinkWrap: true,
//            physics: new NeverScrollableScrollPhysics(),
//            itemCount: berita.length,
//            itemBuilder: (context, i) {
//              return _buildRow(berita[i], i);
//            });
    if(isLoading){
      return CustomWidget().loadingWidget();
    }else{
      if(haveData == false){
        return Center(child: Text("Tidak ada data yang ditampilkan"),);
      }else{
        return ListView.builder(
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          itemCount: berita.length,
          itemBuilder: (context, i) {
          return _buildRow(berita[i], i);
          });
      }

    }
  }

  _buildRow(BeritaModel beritaModel, int i) {
    return ListTile(
        title: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BeritaScreen(beritaModel.idBerita)),
        );
      },
      child: Card(
        margin: EdgeInsets.only(top: 8),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              color: Color.fromRGBO(239, 239, 239, 100),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      beritaModel.judulBerita,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      beritaModel.tanggalBuat,
                      style: Keys().smallFontSize,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      beritaModel.previewBerita,
                      style: Keys().normalFontSize,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget cobaCoba(){
    String data = FunctionDart().getExpirationDate();
    FunctionDart().formatStringToDate(data);
    return Text(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Berita Terbaru",
                    style: new TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  cobaCoba(),
                ],
              )),
          _buildSuggestions(),
        ],
      ),
    );
  }
}
