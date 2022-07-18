import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waroengku_app/detail/header_detail.dart';
import 'package:waroengku_app/detail/hitung_pesanan.dart';
import 'package:waroengku_app/detail/total_harga.dart';
import 'package:waroengku_app/menu/menu.dart';
import 'package:waroengku_app/model/model_makanan.dart';

import 'detail_menu.dart';

class DetailMenu extends StatefulWidget {
  final MenuMakanan makanan;
  const DetailMenu({Key? key, required this.makanan}) : super(key: key);

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  int jumlahPesanan = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            KontenHeader(widget: widget),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                widget.makanan.nama,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    width: 150,
                                    padding: EdgeInsets.only(
                                        left: 5, right: 5, top: 5, bottom: 5),
                                    child: Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                          ),
                                          Text(widget.makanan.rating,
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 16))),
                                          Text("  "),
                                          Text('(+100)',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 16)))
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      //Detail Makanan
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 15),
                        child: Text(widget.makanan.deskripsi),
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
                                  Text(
                                      'Rp ' +
                                          (widget.makanan.harga.toInt())
                                              .toString(),
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20)))
                                ],
                              ),
                              HitungPesanan(
                                  hitung: jumlahPesanan,
                                  tambahPesanan: () {
                                    setState(() {
                                      jumlahPesanan++;
                                    });
                                  },
                                  kurangiPesanan: () {
                                    setState(() {
                                      if (jumlahPesanan <= 0) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Pesanan tidak boleh kurang dari 0");
                                      } else
                                        jumlahPesanan--;
                                    });
                                  })
                            ]),
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
      bottomSheet: Flexible(
        flex: 2,
        child: Container(
          color: Color.fromRGBO(234, 241, 239, 1),
          height: 100.0,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TotalHarga(
                    totalHarga: (jumlahPesanan * widget.makanan.harga).toInt(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      if (jumlahPesanan <= 0) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Warning'),
                                content: Text(
                                    'Mohon untuk menambah porsi terlebih dahulu !'),
                                actions: [
                                  ElevatedButton(
                                    child: Text('Kembali'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Konfirmasi Pesanan'),
                                content: Text('Pesanan' +
                                    ' ' +
                                    widget.makanan.nama +
                                    ' ' +
                                    'sebanyak' +
                                    ' ' +
                                    jumlahPesanan.toString() +
                                    ' ' +
                                    'porsi' +
                                    ' ' +
                                    'mohon untuk ditunggu terimakasih :)'),
                                actions: [
                                  ElevatedButton(
                                    child: Text('Kembali'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Card(
                        elevation: 5,
                        color: Color.fromRGBO(160, 235, 195, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          // width: 250,
                          // height: 80,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
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
                                          fontWeight: FontWeight.w600,
                                          fontSize: 26)))
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Kembali extends StatelessWidget {
  const Kembali({Key? key}) : super(key: key);

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
          },
        ),
      ),
    );
  }
}
