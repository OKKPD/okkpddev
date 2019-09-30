import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/login_screen.dart';
import 'package:okkpd_mobile/pages/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  File _image;

  Future getImage(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);

    setState(() {
      _image = image;
    });
  }

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
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.white70,
        radius: 55.0,
        child:ClipOval(
          child:
        _image == null
          ? Text(' No image ')
            : Image.file(_image,
            width: 100,
            height: 100,
            fit: BoxFit.fill),
        )
      ),
    );

    final nama= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nama Lengkap",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );

    final email= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Email",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );

    final jabatan= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Jabatan",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );


    final profilButton =Padding(
      padding: EdgeInsets.only(left: 90.0, right: 20.0),
      child: Container(
          transform: Matrix4.translationValues(0.0, -35.0, 0.0),
          child:IconButton(
        icon: Icon(Icons.add_a_photo),
        color: Colors.lightBlueAccent,
        onPressed: _asyncConfirmDialog,
      ),
      ),
    );

    final SaveButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          color: Colors.lightBlueAccent,
          child: Text('Update Profile', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final LogoutButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          color: Colors.redAccent,
          child: Text('Logout', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            logo,
            profilButton,
            SizedBox(height: 48.0),
            nama,
            SizedBox(height: 8.0),
            email,
            SizedBox(height: 8.0),
            jabatan,
            SizedBox(height: 48.0),
            SaveButton,
            LogoutButton,
          ],
        ),
      ),
    );
  }
}
