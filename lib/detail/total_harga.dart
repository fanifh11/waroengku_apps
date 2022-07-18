import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalHarga extends StatelessWidget {
  final int totalHarga;
  const TotalHarga({Key? key, required this.totalHarga}) : super(key: key);

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
          'Rp. ' + totalHarga.toString(),
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 30, height: 1.0),
        )
      ],
    );
  }
}
