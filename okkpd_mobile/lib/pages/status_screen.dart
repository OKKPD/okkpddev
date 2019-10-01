import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    void loop(){
      for (int i = 0; i < 1000000; i++){
        ;
      }
    }
    final header = Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "TRACK",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),

          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.black54,
            onPressed: () {
            },
          ),
        ],
      ),
    );

    final track = FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot res){
          var data= [
              {'Track': 'HC','Status':'Ditolak'},
              {'Track': 'Rumah Kemas','Status':'Diterima'},
              {'Track': 'Rumah Kemas','Status':'Diterima'},
              {'Track': 'Rumah Kemas','Status':'Diterima'},
              {'Track': 'Rumah Kemas','Status':'Diterima'},
              {'Track': 'Rumah Kemas','Status':'Diterima'},
              {'Track': 'Rumah Kemas','Status':'Diterima'},
              {'Track': 'Rumah Kemas','Status':'Diterima'},
              {'Track': 'Rumah Kemas','Status':'Diterima'},
              {'Track': 'Prima 2','Status':'Diterima'},
            ];

          final children = <Widget>[];
          for (var datas in data) {
            children.add(new Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                        width: queryData.size.width/3,
                        child:
                          Text(
                            datas['Track'].toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: "NeoSansBold"),
                          ),
                        ),
                      Container(
                        width: queryData.size.width/3,
                        child:
                        Text(
                          datas['Status'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: (datas['Status'].toString() == 'Ditolak')?Colors.redAccent:Colors.green,
                              fontFamily: "NeoSansBold"),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          color: Colors.black54,
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            );
          }
          return new Column(
            children: children,
          );
        }
    );



    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            header,
            SingleChildScrollView(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                    children: <Widget>[
                      track,
                    ]
                )
            ),
          ],
        ),
      ),
    );
  }
}
