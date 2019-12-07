import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/exportModel.dart';
import 'package:okkpd_mobile/model/repository/exportRepo.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:progress_dialog/progress_dialog.dart';

class TambahExportScreen extends StatefulWidget {
  @override
  _TambahExportScreen createState() => _TambahExportScreen();
}

class _TambahExportScreen extends State<TambahExportScreen> {
  ProgressDialog pr;

  var _namaProduk = TextEditingController();
  var _jenisProduk = TextEditingController();
  var _nomorHs = TextEditingController();
  var _namaExportir = TextEditingController();
  var _alamatKantor = TextEditingController();
  var _alamatGudang = TextEditingController();
  var _consigmentCode = TextEditingController();
  var _jumlahLot = TextEditingController();
  var _beratLot = TextEditingController();
  var _jumlahKemasan = TextEditingController();
  var _jenisKemasan = TextEditingController();
  var _beratKotor = TextEditingController();
  var _beratBersih = TextEditingController();
  var _pelabuhanPemberangkatan = TextEditingController();
  var _identitasTransportasi = TextEditingController();
  var _pelabuhanTujuan = TextEditingController();
  var _negaraTujuan = TextEditingController();
  var _negaraTransit = TextEditingController();
  var _pelabuhanTransit = TextEditingController();
  var _transportasiTransit = TextEditingController();

  List<ExportModel> export = [];

  void simpanExport() async {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    try {
      pr.show();
      await ExportRepo().postExport(export, "");
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

    final alamatGudang = FunctionDart.textFormField(
        _alamatGudang, TextInputType.text, 'Alamat Gudang');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Alamat Gudang",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _alamatGudang,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final alamatKantor = FunctionDart.textFormField(
        _alamatKantor, TextInputType.text, 'Alamat Kantor');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Alamat Kantor",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _alamatKantor,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final beratBersih = FunctionDart.textFormField(
        _beratBersih, TextInputType.number, 'Berat Bersih');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Berat Bersih",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _beratBersih,
    //     keyboardType: TextInputType.number,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final beratKotor = FunctionDart.textFormField(
        _beratKotor, TextInputType.number, 'Berat Kotor');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Berat Kotor",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _beratKotor,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final beratLot = FunctionDart.textFormField(
        _beratLot, TextInputType.number, 'Berat Lot');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Berat Lot",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _beratLot,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final consigmentCode = FunctionDart.textFormField(
        _consigmentCode, TextInputType.text, 'Consigment Code');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Consigment Code",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _consigmentCode,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final identitasTransportasi = FunctionDart.textFormField(
        _identitasTransportasi, TextInputType.text, 'Identitas Transportasi');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Identitas Transportasi",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _identitasTransportasi,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final jenisKemasan = FunctionDart.textFormField(
        _jenisKemasan, TextInputType.text, 'Jenis Kemasan');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Jenis Kemasan",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _jenisKemasan,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final jenisProduk = FunctionDart.textFormField(
        _jenisProduk, TextInputType.text, 'Jenis Produk');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Jenis Produk",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _jenisProduk,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final jumlahKemasan = FunctionDart.textFormField(
        _jumlahKemasan, TextInputType.number, 'Jumlah Kemasan');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Jumlah Kemasan",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _jumlahKemasan,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final jumlahLot = FunctionDart.textFormField(
        _jumlahLot, TextInputType.number, 'Jumlah Lot');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Jumlah Lot",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _jumlahLot,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final namaExportir = FunctionDart.textFormField(
        _namaExportir, TextInputType.text, 'Nama Exportir');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Nama Exportir",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _namaExportir,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final namaProduk = FunctionDart.textFormField(
        _namaProduk, TextInputType.text, 'Nama Produk');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Nama Produk",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _namaProduk,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final negaraTransit = FunctionDart.textFormField(
        _negaraTransit, TextInputType.text, 'Negara Transit');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Negara Transit",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _negaraTransit,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final negaraTujuan = FunctionDart.textFormField(
        _negaraTujuan, TextInputType.text, 'Negara Tujuan');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Negara Tujuan",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _negaraTujuan,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final nomorHs =
        FunctionDart.textFormField(_nomorHs, TextInputType.text, 'Nomor HS');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Nomor Hs",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _nomorHs,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final pelabuhanPemberangkatan = FunctionDart.textFormField(
        _pelabuhanPemberangkatan,
        TextInputType.text,
        'Pelabuhan Pemberangkatan');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Pelabuhan Pemberangkatan",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _pelabuhanPemberangkatan,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final pelabuhanTransit = FunctionDart.textFormField(
        _pelabuhanTransit, TextInputType.text, 'Pelabuhan Transit');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Pelabuhan Transit",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _pelabuhanTransit,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final pelabuhanTujuan = FunctionDart.textFormField(
        _pelabuhanTujuan, TextInputType.text, 'Pelabuhan Tujuan');

    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Pelabuhan Tujuan",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _pelabuhanTujuan,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final transportasiTransit = FunctionDart.textFormField(
        _transportasiTransit, TextInputType.text, 'Transportasi Transit');
    //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    //   Text(
    //     "Transportasi Transit",
    //     textAlign: TextAlign.left,
    //     style: TextStyle(
    //         fontSize: 14, color: Colors.black54, fontFamily: "NeoSansBold"),
    //   ),
    //   TextFormField(
    //     controller: _transportasiTransit,
    //     keyboardType: TextInputType.text,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //       hintText: '',
    //     ),
    //   ),
    // ]);

    final saveButton = Padding(
      padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minWidth: queryData.size.width,
        height: queryData.size.height / 13,
        onPressed: () {
          ExportModel exp = ExportModel(
              null,
              null,
              null,
              null,
              _alamatGudang.text,
              _alamatKantor.text,
              _beratBersih.text,
              _beratKotor.text,
              _beratLot.text,
              _consigmentCode.text,
              _identitasTransportasi.text,
              _jenisKemasan.text,
              _jenisProduk.text,
              _jumlahKemasan.text,
              _jumlahLot.text,
              _namaExportir.text,
              _namaProduk.text,
              _negaraTransit.text,
              _negaraTujuan.text,
              _nomorHs.text,
              _pelabuhanPemberangkatan.text,
              _pelabuhanTransit.text,
              _pelabuhanTujuan.text,
              null,
              _transportasiTransit.text);
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FunctionDart.setAppBar("Tambah Export"),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          children: <Widget>[
            SizedBox(height: 16.0),
            namaProduk,
            SizedBox(height: 16.0),
            jenisProduk,
            SizedBox(height: 16.0),
            nomorHs,
            SizedBox(height: 16.0),
            namaExportir,
            SizedBox(height: 16.0),
            alamatKantor,
            SizedBox(height: 16.0),
            alamatGudang,
            SizedBox(height: 16.0),
            consigmentCode,
            SizedBox(height: 16.0),
            jumlahLot,
            SizedBox(height: 16.0),
            beratLot,
            SizedBox(height: 16.0),
            jumlahKemasan,
            SizedBox(height: 16.0),
            jenisKemasan,
            SizedBox(height: 16.0),
            beratKotor,
            SizedBox(height: 16.0),
            beratBersih,
            SizedBox(height: 16.0),
            pelabuhanPemberangkatan,
            SizedBox(height: 16.0),
            identitasTransportasi,
            SizedBox(height: 16.0),
            pelabuhanTujuan,
            SizedBox(height: 16.0),
            negaraTujuan,
            SizedBox(height: 16.0),
            negaraTransit,
            SizedBox(height: 16.0),
            pelabuhanTransit,
            SizedBox(height: 16.0),
            identitasTransportasi,
            SizedBox(height: 16.0),
            transportasiTransit,
            SizedBox(height: 16.0),
            saveButton,
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}
