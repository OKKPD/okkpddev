import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/mediaModel.dart';
import 'package:okkpd_mobile/model/repository/mediaRepo.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MediaBodyWidget extends StatefulWidget {
  String id;
  MediaBodyWidget(this.id);
  @override
  _MediaBodyWidget createState() => _MediaBodyWidget(id);
}

class _MediaBodyWidget extends State<MediaBodyWidget> {
  String id;
  _MediaBodyWidget(this.id);
  // List<MediaBodyModel> model;
  static const String View = 'View';
  static const String Delete = 'Delete';

  static const List<String> choices = <String>[View, Delete];

  final List<MediaModel> model = [];

  ProgressDialog pr;

  bool isLoading = true;

  Future cekDokumen() async {
    var getPict = await MediaRepo().getMediaById(this.id);
    print(getPict);
    var getModel = await MediaRepo().getMediaById(this.id);
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
    var res = choice.split('~');

    if (res[0] == 'Delete') {
      deleteMedia(res[1]);
    } else {}
  }

  void deleteMedia(String id) async {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    try {
      pr.show();
      await MediaRepo().deleteMedia(id);
    } catch (e) {} finally {
      pr.dismiss();
    }
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
                          Text(
                              datas.namaMedia.substring(0, 15) +
                                  '...    ' +
                                  datas.dateUpload,
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
                                        value: choice + '~' + datas.idMedia,
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
                        color: Colors.transparent,
                        child: Image.network(
                          'https://picsum.photos/250?image=9',
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
