import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/repository/login_repo.dart';
import 'package:okkpd_mobile/model/repository/user_repo.dart';
import 'package:okkpd_mobile/pages/login_screen.dart';
import 'package:okkpd_mobile/pages/informasi_profile_screen.dart';
import 'package:okkpd_mobile/pages/ganti_passwod_screen.dart';
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
    var user = await UserRepo().getProfile();
    if(user != null){
      namaLengkapController.text = user.namaLengkap;
      emailController.text = user.username;
      jabatanController.text = "Pelaku Usaha";
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

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
            controller: namaLengkapController,
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
            controller: emailController,
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
            controller: jabatanController,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );


    final profilButton =Padding(
      padding: EdgeInsets.only(left: 90.0, right: 20.0),
      child: Transform(
      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
        child: Container(
            child:IconButton(
              icon: Icon(Icons.add_a_photo),
              color: Colors.lightBlueAccent,
              onPressed: _asyncConfirmDialog,
          ),
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
            LoginRepo().logoutProcess();
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
          children: <Widget>[
            SizedBox(height: 48.0),
            logo,
            profilButton,
            informasi,
            ubahPassword,
            logout,
//            SizedBox(height: 48.0),
//            nama,
//            SizedBox(height: 8.0),
//            email,
//            SizedBox(height: 8.0),
//            jabatan,
//            SizedBox(height: 48.0),
//            SaveButton,
//            LogoutButton,
          ],
        ),
      ),
    );
  }
}
