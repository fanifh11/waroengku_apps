import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          child: Text(
            'Menu',
            style: GoogleFonts.poppins(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25, left: 30),
                  child: Text(
                    'Menu andalan kami',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    'Spesial untuk anda',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color.fromARGB(255, 94, 168, 128),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
