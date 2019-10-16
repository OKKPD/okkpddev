import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okkpd_mobile/model/repository/loginRepo.dart';
import 'package:okkpd_mobile/pages/user/gantiPasswodScreen.dart';
import 'package:okkpd_mobile/pages/user/informasiProfileScreen.dart';
import 'package:okkpd_mobile/pages/login//loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MediaBody extends StatefulWidget {
  @override
  _MediaBody createState() => _MediaBody();
}

class _MediaBody extends State<MediaBody> {
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
          child:ClipOval(
            child:
            _image == null
                ? Text(' No image ')
                : Image.file(_image,
                width: 100,
                height: 100,
                fit: BoxFit.cover),
          )
      ),
    );

    final informasi = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: queryData.size.width/3,
                child:
                Text(
                  "Informasi Detail",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: "NeoSansBold"),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: Colors.grey,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformasiProfilescreen()),
                  );
                },
              ),
            ],
          ),
        ),
        new Divider(
          color: Colors.grey,
        ),
      ],
    );

    final ubahPassword = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: queryData.size.width/3,
                child:
                Text(
                  "Ubah Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: "NeoSansBold"),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: Colors.grey,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GantiPasswordscreen()),
                  );
                },
              ),
            ],
          ),
        ),
        new Divider(
          color: Colors.grey,
        ),
      ],
    );

    final logout = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: queryData.size.width/3,
                child:
                Text(
                  "Logout",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: "NeoSansBold"),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: Colors.grey,
                onPressed: () {
                  LoginRepo().logoutProcess();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        new Divider(
          color: Colors.grey,
        ),
      ],
    );

    final profilButton =Padding(
      padding: EdgeInsets.only(left: 90.0, right: 20.0),
      child: Transform(
        transform: Matrix4.translationValues(0.0, -40.0, 0.0),
        child: Container(
          child:IconButton(
            icon: Icon(Icons.add_a_photo),
            color: Colors.lightBlueAccent,
            onPressed: _asyncConfirmDialog,
          ),
        ),
      ),
    );
    return Center(
      child: ListView(
        children: <Widget>[
          Container(color: Color.fromRGBO(225, 225, 225, 100),padding: EdgeInsets.only(top:36,bottom: 36),
            child: Column(children: <Widget>[
              logo,
              profilButton,
              Text('$namaLengkap'),
            ],),
          ),

          informasi,
          ubahPassword,
          logout,
        ],
      ),
    );
  }

}