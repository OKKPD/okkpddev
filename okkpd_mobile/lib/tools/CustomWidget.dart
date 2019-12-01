import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:okkpd_mobile/constants/key.dart';

class CustomWidget{

  Widget loadingWidget(){
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Loading(color: Colors.blue, indicator: BallSpinFadeLoaderIndicator(), size: 40.0),
        SizedBox(height: 8,),
        Text("Loading", style: Keys().normalFontSize,)
      ],
    ),);
  }
}