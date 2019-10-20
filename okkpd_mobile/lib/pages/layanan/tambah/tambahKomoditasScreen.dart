import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/kelompokKomoditasModel.dart';
import 'package:okkpd_mobile/model/komoditasModel.dart';
import 'package:okkpd_mobile/model/repository/komoditasRepo.dart';
import 'package:okkpd_mobile/model/sektorKomoditasModel.dart';
import 'package:progress_dialog/progress_dialog.dart';

class TambahKomoditasScreen extends StatefulWidget {
  @override
  _TambahKomoditasScreen createState() => _TambahKomoditasScreen();
}

class _TambahKomoditasScreen extends State<TambahKomoditasScreen> {
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

  List getSektor = [];
  List getKelompok = [];
  List getKomoditas = [];
  List<SektorKomoditasModel> sektor = [];
  List<KelompokKomoditasModel> kelompok = [];
  List<KomoditasModel> komoditas = [];
  String idSektor;
  String idKelompok;
  String idKomoditas;
  String namaLatin;
  String nmKomoditas;


  Future getDataSektor() async{
    getSektor = await KomoditasRepo().getSektor();
    setState(() {
      for (var datas in getSektor){
        sektor.add(datas);
      }
    });
  }
  Future getDataKelompok(String idSektor) async{
    getKelompok = await KomoditasRepo().getKelompok(idSektor);
    setState(() {
      for (var datas in getKelompok){
        kelompok.add(datas);
      }
    });
  }
  Future getDataKomoditas(String idSektor,String idKelompok) async{
    getKomoditas = await KomoditasRepo().getKomoditas(idSektor,idKelompok);
    setState(() {
      for (var datas in getKomoditas){
        komoditas.add(datas);
      }
    });
  }

  Future setInit() async {
    getDataSektor();
  }

  void simpanKomoditas() async {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    try {
      pr.show();
      await KomoditasRepo().postKomoditas(komoditas, "prima_3");
    } catch (e) {
      print("Error Insert");
    } finally {
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
   
    final daftarKomoditas =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Identitas Komoditas dan Lahan",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 20, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

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
            child: new Text(value.deskripsi),
            value: value.idKomoditas.toString(),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            idKomoditas = value;
            for(var kmd in komoditas){
              if(kmd.idKomoditas == idKomoditas){
                namaLatin = kmd.namaLatin;
                nmKomoditas = kmd.deskripsi;
              }
            }
            // int index = int.parse(value);
            // namaLatin = getKomoditas[index]['nama_latin'];
            // nmKomoditas = getKomoditas[index]['deskripsi'];
            // _idSektor.text = getKomoditas[index]['id_sektor'];
            // _idKomoditas.text = getKomoditas[index]['kode_komoditas'];
            // _idKelompok.text = getKomoditas[index]['id_kelompok'];
          });
        },
        value: idKomoditas,
      ),
    ]);

    final namaSektor =
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Nama Sektor",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      DropdownButton(
        hint: new Text('Pilih Sektor'),
        isExpanded: true,
        items: sektor.map((value) {
          return new DropdownMenuItem(
            child: new Text(value.namaSektorKomoditas),
            value: value.idSektor.toString(),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            idSektor = value;
            getDataKelompok(idSektor);
            // _namaLatin.text = getKomoditas[index]['nama_latin'];
            // _namaKomoditas.text = getKomoditas[index]['deskripsi'];
            // _idSektor.text = getKomoditas[index]['id_sektor'];
            // _idKomoditas.text = getKomoditas[index]['kode_komoditas'];
            // _idKelompok.text = getKomoditas[index]['id_kelompok'];
          });
        },
        value: idSektor,
      ),
    ]);

    final namaKelompok =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Nama Kelompok",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      DropdownButton(
        hint: new Text('Pilih Kelompok'),
        isExpanded: true,
        items: kelompok.map((value) {
          return new DropdownMenuItem(
            child: new Text(value.namaKelompok),
            value: value.idKelompok.toString(),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            idKelompok = value;
            getDataKomoditas(idSektor,idKelompok);

            // _namaLatin.text = getKomoditas[index]['nama_latin'];
            // _namaKomoditas.text = getKomoditas[index]['deskripsi'];
            // _idSektor.text = getKomoditas[index]['id_sektor'];
            // _idKomoditas.text = getKomoditas[index]['kode_komoditas'];
            // _idKelompok.text = getKomoditas[index]['id_kelompok'];
          });
        },
        value: idKelompok,
      ),
    ]);

    final luasLahan =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Luas Lahan",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _luasLahan,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    final spasiforjarak =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
    ]);

    final saveButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            KomoditasModel kmd = KomoditasModel(null,nmKomoditas,"",idSektor,idKomoditas,idKelompok,_luasLahan.text,nmKomoditas,
            namaLatin);

            Navigator.pop(context, kmd);
          },
          color: Colors.lightBlueAccent,
          child: Text('Tambah', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text("Tambah Komoditas", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 16.0),
            namaSektor,
            SizedBox(height: 16.0),
            namaKelompok,
            SizedBox(height: 16.0),
            namaKomoditas,
            SizedBox(height: 16.0),
            luasLahan,
            SizedBox(height: 16.0),
            spasiforjarak,
            SizedBox(height: 16.0),
            saveButton ,
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}