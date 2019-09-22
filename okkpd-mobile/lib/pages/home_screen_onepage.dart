//ini bagian import, di sini kita import material, design system dari google. Biasanya dipake untuk ui android
//untuk ui ios, biasanya dipakai cupertino. Tapi tidak mustahil untuk mereplikasi ui ios menggunakan material

import 'package:flutter/material.dart';

//class HomeScreen sebagai class Widget yang bisa dipanggil di Widget lain. Kelas ini dipanggil di main.dart, di mana
//saat aplikasi mulai, yang pertama kali dipanggil adalah main.dart-nya, nha di main.dart dipanggil Widget HomeScreen
//class HomeScreen inherit (di sini pakai extends) class StatefulWidget. Stateful Widget itu dipakai jika Widget tsb
//bisa mengalami perubahan. Misalnya kaya textfield dalam form, itu kan waktu sebelum dikasih inputan text isinya kosong, nha
//setelah dikasih inputan text dari keyboard jadi ada isinya kan? nha itu istilahnya "Widget textfield tsb 'state'-nya berubah
//Selain StatefulWidget, ada juga StatelessWidget, itu untuk Widget yg nda perlu ada perubahan, seperti tombol, gambar statis

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//kalo pake StatefulWidget, ada kelas lagi yg 'mengurus' state dari Widget ini, pemanggilannya seperti di bawah ini
//kenapa menggunakan _ di depan nama classnya? Karena emang harus private, dan di dart, cara membuat suatu variabel
//atau class jadi private cuma tinggal dikasih _ di depan nama class/variabel-nya

class _HomeScreenState extends State<HomeScreen> {

  //di setiap Widget, harus ada fungsi build-nya
  @override
  Widget build(BuildContext context) {

    //Scaffold itu biasa dipakai di halaman, karena Widget ini punya parameter appbar, body, sama bottom navigation
    //bar, kan sering ada tu di app-app biasanya, makanya sering dipakai.
    //sebenernya nda harus selalu dimulai dengan Scaffold dalam membuat Widget, tergantung keperluan aja

    return Scaffold(

      //appbar ini yg biasane ada di atas layar, yg biasanya ada judul layar sama tombol navigasi untuk back
      //karena di ios nda ada tombol fisik untuk back, ini jadi salah satu navigasi yg utama untuk ios
      appBar: AppBar(
        title: Text('ini appbar-nya'),
      ),

      //SingleChildScrollView ini biasa dipakai untuk layar yg bisa scroll ke bawah (bisa ke samping juga sih)
      //sebenernya tergantung selera, bisa juga pakai ListView
      body: SingleChildScrollView(

        //karena namanya singlechild, Widget ini cuma boleh punya satu child, di sini kita kasih Widget Column
        //biar jadi 'sarang' Widget2 lainnya
        //kalo pakai ListView tidak perlu column karena ListView bisa punya banyak child
        child: Column(

          //karena Column bisa punya banyak child(children), makanya di sini pakai children untuk menempatkan
          //Widget2 lain di bawahnya
          children: <Widget>[

            //ini bagian gopay

            //Container merupakan Widget yg sering dipakai dalam view. Container punya banyak parameter untuk layout-ing
            //seperti :
            //height untuk mengatur tinggi Container
            //width untuk mengatur lebarnya
            //margin untuk mengatur jarak Container dengan Widget lainnya
            //padding untuk mengatur jarak ISI/child container dengan Container itu sendiri
            //decoration untuk mengatur tampilan Container, seperti warna, bentuk container, dsb
            //dan parameter lainnya
            Container(

              //height : 120, maksudnya tinggi container ini adalah 120 points
              //point sendiri adalah kumpulan beberapa pixel, jadi kita nda bisa 'pixel perfect' di sini
              //yg penting pas lah
                height: 120,

                //dekorasi untuk Containernya
                //gradient itu lebih ke warna container dengan gradient
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

                //dalam container gopay, kan ada dua baris(?) bagian atas buat jjudul 'GOPAY' sama saldo
                //yg bawahnya tombol2nya, jadi kita panggil Widget Column
                child: Column(
                  children: <Widget>[

                    //nha ini yg atas, yg bagian judul sama sisa saldo
                    //dipanggil Container lagi biar gampang ngatur bentuk dan dekorasinya
                    Container(

                      //padding di sini merupakan jarak isi dengan containernya
                      //EdgeInsets.all(angka) itu maksudnya jarak semuanya 12 point
                      //bisa kalian ganti2 sendiri angkanya biar tahu bedanya
                      //selain .all, ada :
                      //EdgeInsets.symmetric(horizontal : angka, vertical : angka)
                      //buat ngatur jarak horizontal sama vertical-nya
                      //EdgeInsets.only(top : angka, bottom : angka, right: angka, left: angka)
                      //buat ngatur jarak satu-satu, jarak atas berapa, jarak kiri berapa, dst

                      //untuk margin juga pakai EdgeInsets
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                               Color(0xff3164bd),
                               Color(0xff295cb5)
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3))),

                      //karena ada bagian kiri sama kanan, kita pakai Widget Row, untuk membagi
                      //jadi beberapa shaft(?) yg kiri untuk teks GOPAY, yg kanan untuk teks saldo
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          //nha ini buat tulisan GOPAY
                          Text(
                            "GOPAY",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "NeoSansBold"),
                          ),

                          //ini buat tulisan saldo, dengan pakai container
                          //coba, apa bedanya?
                          Container(
                            child: Text(
                              "Rp. 12000",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: "NeoSansBold"),
                            ),
                          )
                        ],
                      ),
                    ),

                    //ini bagian kolom yg bawah, isinya tombol-tombol
                    //di sini kita juga pakai Row untuk membaginya
                    Container(
                      padding:
                          EdgeInsets.only(left: 32, right: 32, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 60,

                            //FlatButton itu dipakai untuk membuat tombol
                            //ada banyak Widget selain FlatButton untuk membuat tombol
                            //kita sementara pakai ini dulu ya
                            child: FlatButton(
                              padding: EdgeInsets.all(0),

                              //di onpressed, kita bisa membuat script Dart untuk dijalankan
                              onPressed:(){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  //ini untuk memanggil gambar dari 'luar'
                                  //agar bisa manggil ini, harus diset dulu lokasi 'asset'nya di
                                  //pubspec.yaml
                                  Image.asset(
                                    'res/icons/icon_transfer.png',
                                    width: 32,
                                    height: 32,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                  ),
                                  Text(
                                    "Transfer",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "res/icons/icon_scan.png",
                                width: 32,
                                height: 32,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Text(
                                "Scan QR",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "res/icons/icon_saldo.png",
                                width: 32,
                                height: 32,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Text(
                                "Isi Saldo",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "res/icons/icon_menu.png",
                                width: 32,
                                height: 32,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Text(
                                "Lainnya",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),

            //bagian tombol menu

            //bagian artikel
          ],
        ),
      ),
    );
  }
}
