import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/repository/loginRepo.dart';
import 'package:okkpd_mobile/pages/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Mediascreen extends StatefulWidget{

  @override
  _Mediascreen createState() => _Mediascreen();
}



class _Mediascreen extends State<Mediascreen>{
  @override

  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(


        child: Column(


          children: <Widget>[

            Container(

             height: 120,

                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff3164bd),
                        Color(0xff295cb5)
                      ],
                    ),
                    //border radius tu buat 'kelengkungan' yg ada di sudut2 container
                    borderRadius:
                    BorderRadius.all(Radius.circular(3))),

                child: Column(
                  children: <Widget>[

                    Container(
                      padding:
                      EdgeInsets.only(left: 32, right: 32, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
//                          Container(
//                            width: 50,
//                            height: 60,
//                            child: FlatButton(
//                              padding: EdgeInsets.all(0),
//
//                              onPressed:(){},
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//
//                                  Image.asset(
//                                    'res/icons/icon_transfer.png',
//                                    width: 32,
//                                    height: 32,
//                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.only(top: 10),
//                                  ),
//                                  Text(
//                                    "Transfer",
//                                    style: TextStyle(
//                                        color: Colors.white, fontSize: 12),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
                        ],


                      ),
                    )
                  ],
                )
            ),


          ],
        ),
      ),
    );
  }
}