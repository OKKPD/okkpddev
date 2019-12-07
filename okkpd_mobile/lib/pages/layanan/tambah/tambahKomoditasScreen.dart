import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/kelompokKomoditasModel.dart';
import 'package:okkpd_mobile/model/komoditasModel.dart';
import 'package:okkpd_mobile/model/repository/komoditasRepo.dart';
import 'package:okkpd_mobile/model/sektorKomoditasModel.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:progress_dialog/progress_dialog.dart';

class TambahKomoditasScreen extends StatefulWidget {
  @override
  _TambahKomoditasScreen createState() => _TambahKomoditasScreen();
}

class _TambahKomoditasScreen extends State<TambahKomoditasScreen> {
  ProgressDialog pr;

  var _namaKomoditas = TextEditingController();
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

  Future getDataSektor() async {
    sektor.clear();
    getSektor = await KomoditasRepo().getSektor();
    setState(() {
      for (var datas in getSektor) {
        sektor.add(datas);
      }
    });
  }

  Future getDataKelompok(String idSektor) async {
    kelompok.clear();
    getKelompok = await KomoditasRepo().getKelompok(idSektor);
    setState(() {
      for (var datas in getKelompok) {
        kelompok.add(datas);
      }
    });
  }

  Future getDataKomoditas(String idSektor, String idKelompok) async {
    komoditas.clear();
    getKomoditas = await KomoditasRepo().getKomoditas(idSektor, idKelompok);
    if (getKomoditas != null) {
      setState(() {
        for (var datas in getKomoditas) {
          komoditas.add(datas);
        }
      });
    } else {
      FunctionDart().setToast('Belum Ada Komoditas');
      // Navigator.pop(context, null);
    }
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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final namaKomoditas =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Nama Sektor',
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(8.0),
            borderSide: new BorderSide(),
          ),
        ),
        items: komoditas.map((value) {
          return new DropdownMenuItem(
            child: new Text(value.deskripsi),
            value: value.idKomoditas.toString(),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            idKomoditas = value;
            for (var kmd in komoditas) {
              if (kmd.idKomoditas == idKomoditas) {
                namaLatin = kmd.namaLatin;
                nmKomoditas = kmd.deskripsi;
              }
            }
          });
        },
        value: idKomoditas,
      ),
    ]);

    final namaSektor =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Nama Sektor',
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(8.0),
            borderSide: new BorderSide(),
          ),
        ),
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
          });
        },
        value: idSektor,
      ),
    ]);

    final namaKelompok =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Nama Kelompok',
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(8.0),
            borderSide: new BorderSide(),
          ),
        ),
        items: kelompok.map((value) {
          return new DropdownMenuItem(
            child: new Text(value.namaKelompok),
            value: value.idKelompok.toString(),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            idKelompok = value;
            getDataKomoditas(idSektor, idKelompok);
          });
        },
        value: idKelompok,
      ),
    ]);

    final luasLahan = FunctionDart.textFormField(
        _luasLahan, TextInputType.number, 'Luas Lahan');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Luas Lahan",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _luasLahan,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

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
      padding: EdgeInsets.only(
          left: 0.0, right: 0.0, top: queryData.size.height / 3.7, bottom: 0.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minWidth: queryData.size.width,
        height: queryData.size.height / 13,
        onPressed: () {
          KomoditasModel kmd = KomoditasModel(null, nmKomoditas, "", idSektor,
              idKomoditas, idKelompok, _luasLahan.text, nmKomoditas, namaLatin);
          if (idSektor == null ||
              idKomoditas == null ||
              idKelompok == null ||
              _luasLahan.text.length == 0) {
            FunctionDart().setToast('Data Form Pendaftaran Tidak Lengkap');
          } else {
            Navigator.pop(context, kmd);
          }
        },
        color: Color(0xff2ECC71),
        child: Text('Tambah Data', style: TextStyle(color: Colors.white)),
      ),
    );

    // final saveButton = Padding(
    //   padding: EdgeInsets.symmetric(vertical: 0.0),
    //   child: Material(
    //     child: MaterialButton(
    //       minWidth: 200.0,
    //       height: 42.0,
    //       onPressed: () {
    //         KomoditasModel kmd = KomoditasModel(
    //             null,
    //             nmKomoditas,
    //             "",
    //             idSektor,
    //             idKomoditas,
    //             idKelompok,
    //             _luasLahan.text,
    //             nmKomoditas,
    //             namaLatin);
    //         if (idSektor == null ||
    //             idKomoditas == null ||
    //             idKelompok == null ||
    //             _luasLahan.text.length == 0) {
    //           FunctionDart().setToast('Data Form Pendaftaran Tidak Lengkap');
    //         } else {
    //           Navigator.pop(context, kmd);
    //         }
    //       },
    //       color: Colors.lightBlueAccent,
    //       child: Text('Tambah', style: TextStyle(color: Colors.white)),
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FunctionDart.setAppBar("Tambah Komoditas"),
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
            saveButton,
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}
