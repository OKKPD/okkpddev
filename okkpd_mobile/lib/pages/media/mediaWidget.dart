import 'package:flutter/material.dart';

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
        {'Media': 'Scan KTP', 'Folder': 'Lihat'},
        {'Media': 'Scan Surat Lampiran', 'Folder': 'Lihat'},
        {'Media': 'Scan Ijazah', 'Folder': 'Lihat'},
        {'Media': 'Scan Transkip NIlai', 'Folder': 'Lihat'},
        {'Media': 'Scan SIUP', 'Folder': 'Lihat'},
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
              print("tapped");
              Navigator.of(context).pushNamed('/mediaBody');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: queryData.size.width / 3,
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
                        width: queryData.size.width / 4,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(15.0),
                          border: new Border.all(
                            width: 5.0,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: new Divider(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: queryData.size.width / 3,
                        child: Text(
                          "Folder disini",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: "NeoSansBold"),
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
//            header,
        SizedBox(height: 10.0),
        SingleChildScrollView(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(children: <Widget>[
              track,
            ])),
      ],
    );
  }
}
