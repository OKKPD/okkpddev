import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/mediaModel.dart';
import 'package:okkpd_mobile/model/repository/mediaRepo.dart';

class MediaBodyWidget extends StatefulWidget {
  @override
  _MediaBodyWidget createState() => _MediaBodyWidget();
}

class _MediaBodyWidget extends State<MediaBodyWidget> {
  // List<MediaBodyModel> model;
  static const String View = 'View';
  static const String Delete = 'Delete';

  static const List<String> choices = <String>[View, Delete];

  final List<MediaModel> model = [];

  bool isLoading = true;

  Future cekDokumen() async {
    var getModel = await MediaRepo().getStatusDokumen();
    setState(() {
      this.model.addAll(getModel);
    });

    if (model.length > 0) {
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    cekDokumen();
  }

  Widget isChecked(String status) {
    if (status == '1') {
      return Icon(Icons.check, color: Colors.green);
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void choiceAction(String choice) {
    // if (choice == Constants.Settings) {
    //   print('Settings');
    // } else if (choice == Constants.Subscribe) {
    //   print('Subscribe');
    // } else if (choice == Constants.SignOut) {
    //   print('SignOut');
    // }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final track =
        FutureBuilder(builder: (BuildContext context, AsyncSnapshot res) {
      final children = <Widget>[];
      for (var datas in model) {
        children.add(new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 1.0, 1.0, 1.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("1 Desember 2019",
                              style: new TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Container(
                            width: queryData.size.width / 10,
                            alignment: Alignment.topRight,
                            child: Transform.rotate(
                                angle: 1.55,
                                origin: Offset(0.0, 0.0),
                                child: PopupMenuButton<String>(
                                  onSelected: choiceAction,
                                  itemBuilder: (BuildContext context) {
                                    return choices.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                )),
                          )
                        ])),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: queryData.size.width / 1.219,
                        height: queryData.size.width / 2,
                        color: Colors.grey,
                        child: Image.asset('assets/logo.png'),
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

    return (isLoading)
        ? Center(child: const CircularProgressIndicator())
        : ListView(
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
