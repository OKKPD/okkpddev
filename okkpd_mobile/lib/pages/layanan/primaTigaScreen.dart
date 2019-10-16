import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/komoditasModel.dart';
import 'package:okkpd_mobile/model/repository/komoditasRepo.dart';
import 'package:okkpd_mobile/model/repository/userRepo.dart';
import 'package:okkpd_mobile/model/userModel.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrimatigaScreen extends StatefulWidget{
  @override

  _PrimatigaScreen createState() => _PrimatigaScreen();

}

class _PrimatigaScreen extends State<PrimatigaScreen>{

  ProgressDialog pr;

  var _jenisPerusahaanController = TextEditingController();
  var _namaUsahaController = TextEditingController();
  var _alamatPerusahaanController = TextEditingController();
  var _namaPemohonController = TextEditingController();
  var _nomorKtpPemohonController = TextEditingController();
  var _nomorHpPemohonController = TextEditingController();
  var _namaKomoditas= TextEditingController();
  var _idSektor= TextEditingController();
  var _idKomoditas= TextEditingController();
  var _idKelompok= TextEditingController();
  var _namaLatin= TextEditingController();
  var _luasLahan = TextEditingController();

  List getKomoditas = [];
  List komoditas = [];
  String _komoditas;

  Future setInit() async {
    getKomoditas = await KomoditasRepo().getKomoditas();
    setState(() {
      var i = 0;
      for (var datas in getKomoditas){
        komoditas.add({'key':i,'val':datas['deskripsi']});
        i++;
      }
    });

    UserModel user = await UserRepo().getProfile();
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('loginNama', user.namaLengkap);
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
      await KomoditasRepo().postKomoditas(komoditas, "prima_3");
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
    setInit();
  }

  @override
  Widget build(BuildContext context) {

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

    final namaKomoditas =
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Nama Komoditas",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      DropdownButton(
        hint: new Text('Pilih Komoditas'),
        isExpanded: true,
        items: komoditas.map((value) {
          return new DropdownMenuItem(
            child: new Text(value['val']),
            value: value['key'].toString(),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            int index = int.parse(value);
            _komoditas = value;
            _namaLatin.text = getKomoditas[index]['nama_latin'];
            _namaKomoditas.text = getKomoditas[index]['deskripsi'];
            _idSektor.text = getKomoditas[index]['id_sektor'];
            _idKomoditas.text = getKomoditas[index]['kode_komoditas'];
            _idKelompok.text = getKomoditas[index]['id_kelompok'];
          });
        },
        value: _komoditas,
      ),
    ]);


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

    final saveButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            simpanKomoditas();
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

            spasiforjarak,
            SizedBox(height: 20.0),
            saveButton ,
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }


}