import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/homeScreen.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PrimatigaScreen extends StatefulWidget{
  @override

  _PrimatigaScreen createState() => _PrimatigaScreen();

}

class _PrimatigaScreen extends State<PrimatigaScreen>{

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

  var _jenisPerusahaanController = TextEditingController();
  var _namaUsahaController = TextEditingController();
  var _jabatanPemohon = TextEditingController();
  var _namaPemohonController = TextEditingController();
  var _nomorKtpPemohonController = TextEditingController();
  var _nomorNpwpPemohonController = TextEditingController();
  var _alamatPerusahaanController = TextEditingController();

  var _noRT = TextEditingController();
  var _noRW = TextEditingController();
  var _namaKota = TextEditingController();
  var _kecamatan = TextEditingController();
  var _kelurahan = TextEditingController();
  var _namaKopsurat = TextEditingController();
  var _noTlpn = TextEditingController();
  var _noHp = TextEditingController();
  var _namaDinas = TextEditingController();
  var _namakepaladinas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
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
            "PENDAFTARAN PRIMA 3",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          )
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
            controller: _jenisPerusahaanController,
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
            "Nama Perusahaan / Kelompok / Perorangan",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _namaUsahaController,
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
            controller: _alamatPerusahaanController,
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
            controller: _namaPemohonController,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
    );

//    final nomorKtpPemohon= Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children:<Widget>[
//          Text(
//            "Nomor KTP Pemohon",
//            textAlign: TextAlign.left,
//            style: TextStyle(
//                fontSize: 14,
//                color: Colors.black54,
//                fontFamily: "NeoSansBold"),
//          ),
//          TextFormField(
//            controller: _nomorKtpPemohonController,
//            keyboardType: TextInputType.text,
//            autofocus: false,
//            decoration: InputDecoration(
//              hintText: '',
//            ),
//          ),
//        ]
//    );

    final jabatanPemohon= Column(
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
            controller: _jabatanPemohon,
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
                  controller: _nomorKtpPemohonController,
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
                  controller: _nomorNpwpPemohonController,
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


    final noRT= Column(
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
            controller: _noRT,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
    );

    final noRW= Column(
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
            controller: _noRW,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
    );


    final namaKota= Column(
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
            controller: _namaKota,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
    );

    final namaKelurahan= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Kelurahan",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _kelurahan,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
    );


    final namaKecamatan= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Kecamatan",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _kecamatan,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
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
              Container(
                width: queryData.size.width/2,
                child: TextFormField(
                  controller: _namaKopsurat,
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
                    _asyncConfirmDialog('Kop Surat');
                  },
                  color: clrNpwp,
                  child: Text('Pick File', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ]
    );

    final noTlpn= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nomer Telephone",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _noTlpn,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
    );

    final noHp= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "No Hp",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _noHp,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
    );

    final namaDinas= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nama Dinas",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _namaDinas,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
    );

    final namaKepalaDinas= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nama Kepala Dinas",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _namakepaladinas,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          )
        ]
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
          child: Text('Simpan', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pendaftaran PRIMA 3",style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
//            header,
            SizedBox(height: 20.0),
            jenisPerusahaan,
            SizedBox(height: 20.0),
            SizedBox(height: 20.0),
            namaPemohon,
            SizedBox(height: 20.0),
            jabatanPemohon,
            SizedBox(height: 20.0),
            noKtp,
            SizedBox(height: 20.0),
            noNpwp,
            SizedBox(height: 20.0),
            namaUsaha,
            SizedBox(height: 20.0),
            alamatPerusahaan,

            SizedBox(height: 20.0),
            noRT,
            SizedBox(height: 20.0),
            noRW,
            SizedBox(height: 20.0),
            namaKota,

            SizedBox(height: 20.0),
            noRT,
            SizedBox(height: 20.0),
            noRW,
            SizedBox(height: 20.0),
            namaKota,
            SizedBox(height: 20.0),
            namaKelurahan,
            SizedBox(height: 20.0),
            namaKecamatan,
            SizedBox(height: 20.0),
            kopSurat,
            SizedBox(height: 20.0),
            noTlpn,
            SizedBox(height: 20.0),
            noHp,
            SizedBox(height: 20.0),
            namaDinas,
            SizedBox(height: 20.0),
            namaKepalaDinas,

            SizedBox(height: 20.0),
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