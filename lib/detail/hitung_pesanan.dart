import 'package:flutter/material.dart';

class HitungPesanan extends StatelessWidget {
  final int hitung;
  final VoidCallback tambahPesanan, kurangiPesanan;
  const HitungPesanan(
      {Key? key,
      required this.hitung,
      required this.tambahPesanan,
      required this.kurangiPesanan})
      : super(key: key);

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
              child: Text(hitung.toString())),
          IconButton(
            onPressed: kurangiPesanan,
            icon: Icon(Icons.remove_circle),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
