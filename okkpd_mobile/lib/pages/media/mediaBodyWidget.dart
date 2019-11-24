import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaBodyWidget extends StatefulWidget {
  final int index;
  MediaBodyWidget(this.index);
  @override
  _MediaBodyWidget createState() => _MediaBodyWidget(index);
}

class _MediaBodyWidget extends State<MediaBodyWidget> {
  int index;
  _MediaBodyWidget(this.index);

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
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ambil Gambar'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Kamera'),
              onPressed: () {
                getImage(ImageSource.camera);
                Navigator.pop(context, '');
              },
            ),
            FlatButton(
              child: const Text('Galeri'),
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
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero' + this.index.toString(),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 55.0,
          child: ClipOval(
            child: _image == null
                ? Text(' No Image ')
                : Image.file(_image,
                    width: 100, height: 100, fit: BoxFit.cover),
          )),
    );
    final profilButton = Transform(
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      child: Padding(
        padding: EdgeInsets.only(left: 90.0, right: 20.0),
        child: Container(
          height: 16,
          child: IconButton(
            icon: Icon(Icons.add_a_photo),
            color: Colors.lightBlueAccent,
            onPressed: _asyncConfirmDialog,
          ),
        ),
      ),
    );

    return Container(
      child: Column(
        children: <Widget>[logo, profilButton],
      ),
    );
  }
}
