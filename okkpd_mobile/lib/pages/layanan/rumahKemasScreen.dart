import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/komoditasModel.dart';
import 'package:okkpd_mobile/model/repository/komoditasRepo.dart';
import 'package:okkpd_mobile/model/repository/userRepo.dart';
import 'package:okkpd_mobile/model/userModel.dart';
import 'package:okkpd_mobile/pages/homeScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Rumahkemas extends StatefulWidget{
  @override

  _Rumahkemas createState() => _Rumahkemas();
}

class _Rumahkemas extends State<Rumahkemas>{
  ProgressDialog pr = null;
  var _jenisPerusahaanController = TextEditingController();
  var _namaUsahaController = TextEditingController();
  var _alamatPerusahaanController = TextEditingController();
  var _namaPemohonController = TextEditingController();
  var _nomorKtpPemohonController = TextEditingController();
  var _nomorHpPemohonController = TextEditingController();
  var _namaKomoditas = TextEditingController();
  var _luasLahan = TextEditingController();
  
  Future setUser() async {
    UserModel user = await UserRepo().getProfile();
    print(user);
    if(user != null){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('loginNama',user.namaLengkap);
      _namaPemohonController.text = user.namaLengkap;
      _jenisPerusahaanController.text = user.jenisUsaha;
      _namaUsahaController.text = user.namaUsaha;
      _nomorHpPemohonController.text = user.noHp;
      _nomorKtpPemohonController.text = user.noKtp;
      _alamatPerusahaanController.text = user.alamatLengkap;
    }
  }

  void simpanKomoditas() async{
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    KomoditasModel komoditas = new KomoditasModel(null, null,
        "I", "002", "02",
        _luasLahan.text, _namaKomoditas.text, "Oryza Sativa");

    try {
      pr.show();
      await KomoditasRepo().postKomoditas(komoditas, "kemas");
    }catch(e){
      print("Error Insert");
    }finally{
      _luasLahan.text = "";
      _namaKomoditas.text = "";
      pr.dismiss();
    }
  }

  @override
  void initState() {
    super.initState();
    setUser();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    

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
            "Nama Usaha",
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
            "Alamat Perusahaan",
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
            controller: _nomorKtpPemohonController,
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
            controller: _nomorHpPemohonController,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );



    final daftarKomoditas= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Identitas Komoditas dan Lahan",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),

        ]
    );

    final namaKomoditas= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Nama Komoditas",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _namaKomoditas,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );


    final luasLahan= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Luas Lahan",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _luasLahan,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
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
        title: Text("Pendaftaran RUMAH KEMAS",style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 20.0),
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
            daftarKomoditas,
            SizedBox(height: 20.0),
            namaKomoditas,
            SizedBox(height: 20.0),
            luasLahan,
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