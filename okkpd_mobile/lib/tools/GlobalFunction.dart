import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FunctionDart{
  void setToast(String kata){
    Fluttertoast.showToast(
          msg: "$kata",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
        );
  }
}