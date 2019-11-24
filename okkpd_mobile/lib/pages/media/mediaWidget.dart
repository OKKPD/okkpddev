import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/media/mediaBody.dart';

class MediaWidget extends StatefulWidget {
  @override
  _MediaWidget createState() => _MediaWidget();
}

class _MediaWidget extends State<MediaWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final track =
        FutureBuilder(builder: (BuildContext context, AsyncSnapshot res) {
      var data = [
        {'Media': 'Surat Pernyataan Kesanggupan', 'id': '1'},
        {'Media': 'Dokumen Legalitas Perusahaan', 'id': '2'},
        {'Media': 'Struktur Organisasi', 'id': '3'},
        {'Media': 'Jenis Komoditas Dan Peta Lahan', 'id': '4'},
        {'Media': 'Sertifikat Prima 3', 'id': '5'},
        {'Media': 'Surat Keterangan Domisili', 'id': '6'},
        {'Media': 'Akta Pendirian Dan Badan Usaha', 'id': '8'},
        {'Media': 'Surat Ijin Usaha Perdagangan', 'id': '9'},
        {'Media': 'Dokumen Kerjasama Dengan Pemasok', 'id': '10'},
        {'Media': 'SIUP', 'id': '11'},
        {'Media': 'Dokumen Akta Perusahaan', 'id': '12'},
        {'Media': 'Sertifikat HS', 'id': '13'},
        {'Media': 'Sertifikat GMP/HACPP/ISO2000', 'id': '14'},
      ];
      final children = <Widget>[];
      for (var datas in data) {
        children.add(new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MediaBody(datas['Media'].toString(), datas['id'])),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: queryData.size.width / 1.5,
                        height: 30,
                        child: Text(
                          datas['Media'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: "NeoSansBold"),
                        ),
                      ),
                      Container(
                        width: queryData.size.width / 10,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: IconButton(
                          icon: Icon(Icons.check),
                          color: Colors.green,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
      }
      return new Column(
        children: children,
      );
    });

    return ListView(
      children: <Widget>[
        SingleChildScrollView(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(children: <Widget>[
              SizedBox(height: 24.0),
              track,
            ])),
      ],
    );
  }
}
