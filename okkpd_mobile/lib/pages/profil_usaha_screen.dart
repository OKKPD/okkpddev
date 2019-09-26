import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/login_screen.dart';
import 'package:okkpd_mobile/pages/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class ProfilUsahaScreen extends StatefulWidget {
  @override
  _ProfilUsahaScreenState createState() => _ProfilUsahaScreenState();
}

class _ProfilUsahaScreenState extends State<ProfilUsahaScreen> {


  @override
  Widget build(BuildContext context) {

    final header = Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xdfe6e9),
            Color(0xdfe6e9)
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Text(
            "PROFIL USAHA",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),

          //ini buat tulisan saldo, dengan pakai container
          //coba, apa bedanya?
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.black54,
            onPressed: () {
            },
          ),
        ],
      ),
    );

    final jenisUsaha= Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
      Text(
        "Jenis Usaha",
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

    final namaPemohon= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nama Pemohon",
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

    final jabatan= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Jabatan Pemohon",
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

    final noKtp= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "No KTP",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 220.0,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: '',
                  ),
                ),
              ),
              Material(
                child: MaterialButton(
                  minWidth: 100.0,
                  height: 30.0,
                  onPressed: () {
                  },
                  color: Colors.redAccent,
                  child: Text('Pick File', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ]
    );

    final noNpwp= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "No NPWP",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 220.0,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: '',
                  ),
                ),
              ),
              Material(
                child: MaterialButton(
                  minWidth: 100.0,
                  height: 30.0,
                  onPressed: () {
                  },
                  color: Colors.redAccent,
                  child: Text('Pick File', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ]
    );

    final namaPerusahaan= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nama Perusahaan / Kelompok / Perorangan",
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

    final alamatPerusahaan= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Alamat Perusahaan / Kelompok / Perorangan",
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
          child: Text('Save Profile', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            header,
            jenisUsaha,
            SizedBox(height: 20.0),
            namaPemohon,
            SizedBox(height: 20.0),
            jabatan,
            SizedBox(height: 20.0),
            noKtp,
            SizedBox(height: 20.0),
            noNpwp,
            SizedBox(height: 20.0),
            namaPerusahaan,
            SizedBox(height: 20.0),
            alamatPerusahaan,
            SizedBox(height: 48.0),
            SaveButton,
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}
