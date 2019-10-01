import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class ProfilUsahaScreen extends StatefulWidget {
  @override
  _ProfilUsahaScreenState createState() => _ProfilUsahaScreenState();
}

class _ProfilUsahaScreenState extends State<ProfilUsahaScreen> {
  File _imageKTP;
  File _imageNPWP;
  File _imageKopSurat;

  Color clrKtp = Colors.redAccent;
  Color clrNpwp = Colors.redAccent;
  Color clrKopSurat = Colors.redAccent;

  Future getImage(ImageSource source, String fileName) async {
    File image = await ImagePicker.pickImage(source: source);

    setState(() {
      if(fileName == 'KTP') {
        _imageKTP = image;
        print(image);
        if(image != null) {
          clrKtp = Colors.green;
        }else{
          clrKtp = Colors.redAccent;
        }
      }else if(fileName == 'NPWP'){
        _imageNPWP = image;
        if(image != null) {
          clrNpwp = Colors.green;
        }else{
          clrNpwp  = Colors.redAccent;
        }
      }else{
        _imageKopSurat = image;
        if(image != null) {
          clrKopSurat = Colors.green;
        }else{
          clrKopSurat  = Colors.redAccent;
        }
      }
    });
  }

  Future _asyncConfirmDialog(String fileName) async {
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
                if( fileName == 'KTP') {
                  getImage(ImageSource.camera,'KTP');
                }else if(fileName == 'NPWP'){
                  getImage(ImageSource.camera,'NPWP');
                }else{
                  getImage(ImageSource.camera,'KOP');
                }
                Navigator.pop(context, '');
              },
            ),
            FlatButton(
              child: const Text('Gallery'),
              onPressed: () {
                if( fileName == 'KTP') {
                  getImage(ImageSource.gallery,'KTP');
                }else if(fileName == 'NPWP'){
                  getImage(ImageSource.gallery,'NPWP');
                }else{
                  getImage(ImageSource.gallery,'KOP');
                }
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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final header = Container(
      padding: EdgeInsets.all(12),
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
                width: queryData.size.width/2,
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
                  minWidth: queryData.size.width/5,
                  height: 30.0,
                  onPressed: () {
                    _asyncConfirmDialog('KTP');
                  },
                  color: clrKtp,
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
                width: queryData.size.width/2,
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
                  minWidth: queryData.size.width/6,
                  height: 30.0,
                  onPressed: () {
                    _asyncConfirmDialog('NPWP');
                  },
                  color: clrNpwp,
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


    final alamatDetail= Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: queryData.size.width/6,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text(
                        "RT",
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
                ),
              ),
              Container(
                width: queryData.size.width/6,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text(
                        "RW",
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
                ),
              ),
              Container(
                width: queryData.size.width/2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text(
                        "Kota",
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
                ),
              ),
            ],
          ),
        ]
    );

    final informasiDetail= Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: queryData.size.width/2.5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text(
                        "No Telfon",
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
                ),
              ),
              Container(
                width: queryData.size.width/2.5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text(
                        "No HP",
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
                ),
              ),
            ],
          ),
        ]
    );

    final kopSurat= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Kop Surat",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Material(
                child: MaterialButton(
                  minWidth: 100.0,
                  height: 30.0,
                  onPressed: () {
                    _asyncConfirmDialog('KOP');
                  },
                  color: clrKopSurat,
                  child: Text('Pick File', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ]
    );



    final SaveButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        child: MaterialButton(
          minWidth: queryData.size.width/1,
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
          children: <Widget>[
            header,
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                children: <Widget>[
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
                  SizedBox(height: 20.0),
                  alamatDetail,
                  SizedBox(height: 20.0),
                  kopSurat,
                  SizedBox(height: 20.0),
                  informasiDetail,
                  SizedBox(height: 48.0),
                  SaveButton,
                  SizedBox(height: 48.0),
                ]
              )
            ),
          ],
        ),
      ),
    );
  }
}
