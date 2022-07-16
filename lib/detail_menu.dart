import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waroengku_app/home.dart';
import 'package:waroengku_app/menu.dart';
import 'package:waroengku_app/model/model_makanan.dart';

import 'detail_menu.dart';

class DetailMenu extends StatelessWidget {
  final MenuMakanan makanan;

  const DetailMenu({Key? key, required this.makanan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image.asset(makanan.gambarDalam)),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Kembali(),
                        // const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            makanan.nama,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                width: 150,
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                    ),
                                    Text(makanan.rating,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16))),
                                    Text("  "),
                                    Text('(+100)',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16)))
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    //Detail Makanan
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 15),
                      child: Text(makanan.deskripsi),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Harga'),
                                Text('${makanan.harga}',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20)))
                              ],
                            ),
                            HitungPesanan(
                              makanan: makanan,
                            )
                          ]),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
      bottomSheet: Container(
        color: Color.fromRGBO(234, 241, 239, 1),
        height: 100.0,
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TotalHarga(),
              Card(
                  elevation: 5,
                  color: Color.fromRGBO(160, 235, 195, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 250,
                    height: 80,
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restaurant,
                        ),
                        Text("  "),
                        Text('Pesan',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 26)))
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Kembali extends StatefulWidget {
  const Kembali({Key? key}) : super(key: key);

  @override
  State<Kembali> createState() => _KembaliState();
}

class _KembaliState extends State<Kembali> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              _HitungPesananState.hitung = 0;
            });
          },
        ),
      ),
    );
  }
}

class HitungPesanan extends StatefulWidget {
  static int count = 0;
  final MenuMakanan makanan;
  const HitungPesanan({Key? key, required this.makanan}) : super(key: key);

  @override
  State<HitungPesanan> createState() => _HitungPesananState();
}

class _HitungPesananState extends State<HitungPesanan> {
  static int hitung = HitungPesanan.count;
  int sementara = 0;
  static double harga = 10000;
  double x = 0;
  double a = _TotalHargaState.harga;

  void tambahPesanan() {
    setState(() {
      // double hargaT = 20000;
      hitung++;
      x += harga;
      print(x);
    });
  }

  void kurangiPesanan() {
    setState(() {
      hitung--;
      x -= harga;
      print("aku ngurang");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: tambahPesanan,
            icon: Icon(Icons.add_circle),
            iconSize: 30,
          ),
          Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text('${hitung}')),
          IconButton(
            onPressed: () {
              if (hitung <= 0) {
                Fluttertoast.showToast(
                    msg: 'Pesanan tidak boleh kurang dari 0');
              } else {
                kurangiPesanan();
              }
            },
            icon: Icon(Icons.remove_circle),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}

class TotalHarga extends StatefulWidget {
  const TotalHarga({
    Key? key,
  }) : super(key: key);
  @override
  State<TotalHarga> createState() => _TotalHargaState();
}

class _TotalHargaState extends State<TotalHarga> {
  int ambilCount = HitungPesanan.count;
  // int angka = _HitungPesananState._count;
  static double harga = 20000;

  int sementara = 0;

  void ubahHarga() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Harga',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        Text(
          '${harga}',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 30, height: 1.0),
        )
      ],
    );
  }
}
