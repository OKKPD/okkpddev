import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/homeScreen.dart';

class GantiPasswordscreen extends StatefulWidget{
  @override
  _GantiPasswordscreen createState() => _GantiPasswordscreen();
}

class _GantiPasswordscreen extends State<GantiPasswordscreen>{

  var _passwordLamaController = TextEditingController();
  var _passwordBaruController = TextEditingController();
  var _passwordBaru2Controller = TextEditingController();
  @override

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final SaveButton = Padding(
      padding: EdgeInsets.only(left: 0.0,right: 0.0,top: queryData.size.height/2.5,bottom: 0.0),
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

    final passwordLama= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Password Lama",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _passwordLamaController,
            obscureText:true,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );

    final passwordBaru= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Password Baru",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _passwordBaruController,
            obscureText:true,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );

    final passwordBaru2= Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            "Ulangi Password",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontFamily: "NeoSansBold"),
          ),
          TextFormField(
            controller: _passwordBaru2Controller,
            obscureText:true,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ]
    );



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Ubah Password",style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
//            header,
            SizedBox(height: 20.0),
            passwordLama,
            SizedBox(height: 20.0),
            passwordBaru,
            SizedBox(height: 20.0),
            passwordBaru2,
            SizedBox(height: 20.0),
            SaveButton,
          ],
        ),
      ),
    );
  }
}