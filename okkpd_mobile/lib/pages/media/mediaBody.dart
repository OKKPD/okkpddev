import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MediaBody extends StatefulWidget {
  final String name;
  MediaBody(this.name);

  @override
  _MediaBody createState() => _MediaBody(name);
}

class _MediaBody extends State<MediaBody> {
  final String name;
  _MediaBody(this.name);

  File _image;

  Future getImage(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);

    setState(() {
      _image = image;
    });
  }

  String namaLengkap = '';
  var namaLengkapController = TextEditingController();
  var emailController = TextEditingController();
  var jabatanController = TextEditingController();

  Future _asyncConfirmDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Image'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Camera'),
              onPressed: () {
                getImage(ImageSource.camera);
                Navigator.pop(context, '');
              },
            ),
            FlatButton(
              child: const Text('Gallery'),
              onPressed: () {
                getImage(ImageSource.gallery);
                Navigator.pop(context, '');
              },
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  void getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namaLengkap = prefs.getString('loginNama');
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 55.0,
          child: ClipOval(
            child: _image == null
                ? Text(' No image ')
                : Image.file(_image,
                    width: 100, height: 100, fit: BoxFit.cover),
          )),
    );
    final profilButton = Transform(
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      child: Padding(
        padding: EdgeInsets.only(left: 90.0, right: 20.0),
        child: Container(
          child: IconButton(
            icon: Icon(Icons.add_a_photo),
            color: Colors.lightBlueAccent,
            onPressed: _asyncConfirmDialog,
          ),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(this.name, style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 24.0),
                    logo,
                    profilButton
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
