import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/exportModel.dart';
import 'package:okkpd_mobile/model/repository/exportRepo.dart';
import 'package:okkpd_mobile/pages/layanan/tambah/tambahExportScreen.dart';
import 'package:okkpd_mobile/tools/GlobalFunction.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DetailHcScreen extends StatefulWidget {
  final String jenis;
  DetailHcScreen(this.jenis);

  @override
  _DetailHcScreen createState() => _DetailHcScreen(jenis);
}

class _DetailHcScreen extends State<DetailHcScreen> {
  final String jenis;
  _DetailHcScreen(this.jenis);

  final List<ExportModel> hcs = [];
  final _normalFont = const TextStyle(fontSize: 14.0);
  final _smallFont = const TextStyle(fontSize: 12.0);
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
  }

  void simpanHc() async {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    try {
      pr.show();
      await ExportRepo().postExport(hcs, 'hc');
    } catch (e) {
      print("Error Insert cuk");
    } finally {
      pr.dismiss();
      Navigator.pop(context, null);
    }
  }

  void _addHc(ExportModel exp) {
    setState(() {
      if (exp != null) {
        hcs.add(exp);
      }
    });
  }

  void _removeHc(int i) {
    setState(() {
      hcs.removeAt(i);
    });
  }

  // final saveButtons =
  void _showMaterialDialog(int i) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hapus Hc'),
            content: Text('Anda yakin untuk menghapus Hc ini?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Tidak')),
              FlatButton(
                onPressed: () {
                  _removeHc(i);
                  _dismissDialog();
                },
                child: Text('Ya'),
              )
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  _buildSuggestions() {
    return ListView.builder(
        itemCount: hcs.length,
        itemBuilder: (context, i) {
          return _buildRow(hcs[i], i);
        });
  }

  _buildRow(ExportModel export, int i) {
    return ListTile(
        title: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                export.namaProduk,
                style: _normalFont,
              ),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                export.negaraTujuan,
                style: _smallFont,
              ),
            )
          ],
        ),
        trailing: RaisedButton(
          onPressed: () {
            _showMaterialDialog(i);
          },
          child: Icon(
            Icons.remove,
            color: Colors.blueAccent,
            size: 36,
          ),
        ));
  }

  _tambahHc(BuildContext context) async {
    final ExportModel result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TambahExportScreen()),
    );
    _addHc(result);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Export HC",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontFamily: "NeoSansBold"),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        onPressed: () {
                          _tambahHc(context);
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.blueAccent,
                          size: 28,
                        ),
                      )),
                ],
              )),
          //Text("asdasd")
          Expanded(child: _buildSuggestions()),
          Container(
              padding:
                  EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8),
              child: new SizedBox(
                width: double.infinity,
                child: new RaisedButton(
                  child: Text("Simpan"),
                  onPressed: () {
                    print(hcs.length);
                    if (hcs.length != 0) {
                      simpanHc();
                    } else {
                      FunctionDart().setToast('HC Tidak Boleh Kosong');
                    }
                  },
                ),
              ))
        ],
      ),
    );
  }
}