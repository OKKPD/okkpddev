import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/produkModel.dart';
import 'package:okkpd_mobile/model/repository/produkRepo.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:progress_dialog/progress_dialog.dart';

class TambahProdukScreen extends StatefulWidget {
  @override
  _TambahProdukScreen createState() => _TambahProdukScreen();
}

class _TambahProdukScreen extends State<TambahProdukScreen> {
  ProgressDialog pr;

  var _namaProduk = TextEditingController();
  var _namaDagang = TextEditingController();
  var _jenisKemasan = TextEditingController();
  var _beratBersih = TextEditingController();
  var _satuanKemasan = TextEditingController();

  List<ProdukModel> produk = [];

  void simpanProduk() async {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    try {
      pr.show();
      await ProdukRepo().postProduk(produk, "");
    } catch (e) {
      print("Error Insert");
    } finally {
      pr.dismiss();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final beratBersih =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Berat Bersih",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _beratBersih,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    final jenisKemasan =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Jenis Kemasan",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _jenisKemasan,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    final namaDagang =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Nama Dagang",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _namaDagang,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    final namaProduk =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Nama Produk",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _namaProduk,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    final satuanKemasan =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "Satuan Kemasan",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
      ),
      TextFormField(
        controller: _satuanKemasan,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: '',
        ),
      ),
    ]);

    final saveButton = Padding(
      padding: EdgeInsets.only(
          left: 0.0, right: 0.0, top: queryData.size.height / 4.2, bottom: 0.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minWidth: queryData.size.width,
        height: queryData.size.height / 13,
        onPressed: () {
          ProdukModel exp = ProdukModel(
              null,
              null,
              null,
              _jenisKemasan.text,
              null,
              _namaDagang.text,
              _namaProduk.text,
              _beratBersih.text,
              _satuanKemasan.text,
              null,
              null);
          if (exp == null) {
            FunctionDart().setToast('Data Form Pendaftaran Tidak Lengkap');
          } else {
            Navigator.pop(context, exp);
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
    //         ProdukModel exp = ProdukModel(
    //             null,
    //             null,
    //             null,
    //             _jenisKemasan.text,
    //             null,
    //             _namaDagang.text,
    //             _namaProduk.text,
    //             _beratBersih.text,
    //             _satuanKemasan.text,
    //             null,
    //             null);
    //         if (exp == null) {
    //           FunctionDart().setToast('Data Form Pendaftaran Tidak Lengkap');
    //         } else {
    //           Navigator.pop(context, exp);
    //         }
    //       },
    //       color: Colors.lightBlueAccent,
    //       child: Text('Tambah', style: TextStyle(color: Colors.white)),
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FunctionDart.setAppBar("Pendaftaran Produk"),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 16.0),
            namaProduk,
            SizedBox(height: 16.0),
            namaDagang,
            SizedBox(height: 16.0),
            jenisKemasan,
            SizedBox(height: 16.0),
            beratBersih,
            SizedBox(height: 16.0),
            satuanKemasan,
            SizedBox(height: 16.0),
            saveButton,
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}
