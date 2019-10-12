import 'package:flutter/material.dart';
import 'package:okkpd_mobile/pages/homeScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import 'package:okkpd_mobile/pages/profilUsaha/profilUsahaBody.dart';

class ProfilUsahaScreen extends StatefulWidget {
  @override
  _ProfilUsahaScreenState createState() => _ProfilUsahaScreenState();
}

class _ProfilUsahaScreenState extends State<ProfilUsahaScreen> {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProfilUsahaBody()
    );
  }
}
