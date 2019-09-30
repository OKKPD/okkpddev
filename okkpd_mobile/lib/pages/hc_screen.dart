import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class Hcscreen extends StatefulWidget{
  @override
  _Hcscreen createState() => _Hcscreen();
}

class _Hcscreen extends State<Hcscreen>{

  @override

  Widget build(BuildContext context) {
    // TODO: implement build


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
            "PENDAFTARAN HC",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),


          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.black54,
            onPressed: () {
            },
          ),
        ],
      ),
    );

    final jenisPerusahaan= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Jenis Perusahaan",
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

    final namaUsaha= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nama Usaha",
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
            "Alamat Perusahaan",
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
          )
        ]
    );

    final nomorKtpPemohon= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nomor KTP Pemohon",
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

    final nomorHpPemohon= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nomor Hp Pemohon",
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


    final namaProdokjenis = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "row 1",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontFamily: "NeoSansBold"),
        ),
        Text(
          " row 2",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontFamily: "NeoSansBold"),
        ),
      ],
    );





    final spasiforjarak= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
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
            jenisPerusahaan,
            SizedBox(height: 20.0),
            namaUsaha,
            SizedBox(height: 20.0),
            alamatPerusahaan,
            SizedBox(height: 20.0),
            namaPemohon,

            SizedBox(height: 20.0),
            nomorKtpPemohon,
            SizedBox(height: 20.0),
            nomorHpPemohon,
            SizedBox(height: 20.0),
            namaProdokjenis,
//            SizedBox(height: 20.0),
//            alamatDetail,
//            SizedBox(height: 20.0),
            spasiforjarak,
            SizedBox(height: 20.0),
            SaveButton,
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}