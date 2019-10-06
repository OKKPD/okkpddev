import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/home_screen.dart';

class InformasiProfilescreen extends StatefulWidget{
  @override
  _InformasiProfilescreen createState() => _InformasiProfilescreen();
}

class _InformasiProfilescreen extends State<InformasiProfilescreen>{

  @override

  Widget build(BuildContext context) {

//    final SaveButton = Padding(
//      padding: EdgeInsets.symmetric(vertical: 0.0),
//      child: Material(
//        child: MaterialButton(
//          minWidth: 200.0,
//          height: 42.0,
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => HomeScreen()),
//            );
//          },
//          color: Colors.lightBlueAccent,
//          child: Text('Simpan', style: TextStyle(color: Colors.white)),
//        ),
//      ),
//    );
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
          child: Text('Simpan', style: TextStyle(color: Colors.white)),
        ),
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Informasi Profil",style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
//            header,
            SizedBox(height: 20.0),
            nama,
            SizedBox(height: 20.0),
            email,
            SizedBox(height: 20.0),
            jabatan,
            SizedBox(height: 20.0),
            SaveButton,
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}