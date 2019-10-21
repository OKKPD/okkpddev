import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/media/mediaBodyWidget.dart';

class MediaBody extends StatefulWidget {
  final String name;
  MediaBody(this.name);

  @override
  _MediaBody createState() => _MediaBody(name);
}

class _MediaBody extends State<MediaBody> {
  final String name;
  _MediaBody(this.name);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.name, style: TextStyle(color: Colors.white)),
        ),
        body: Container(
            child: Column(children: <Widget>[
          GridView.count(
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            padding: EdgeInsets.only(left: 12, top: 16, right: 12, bottom: 12),
            crossAxisCount: 3,
            children: List.generate(1, (index) {
              return Center(
                child: MediaBodyWidget(index),
              );
            }),
          ),
        ])));
  }
}
