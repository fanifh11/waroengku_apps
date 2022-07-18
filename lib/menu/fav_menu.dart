import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waroengku_app/detail/detail_menu.dart';
import 'package:waroengku_app/model/model_makanan.dart';

class FavMenu extends StatelessWidget {
  final MenuMakanan makanan;
  const FavMenu({Key? key, required this.makanan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(229, 237, 229, 1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black26.withOpacity(0.25))
          ]),
      margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Rendang',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 2,
                                  fontSize: 20)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Lengkap dengan sayur \ndan sambal hijau',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 14)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            final MenuMakanan makanan = menuMakananList[0];
                            print(makanan.nama);

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailMenu(
                                makanan: menuMakananList[0],
                              );
                            }));
                          },
                          child: Container(
                            width: 180,
                            margin: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: Colors.black26.withOpacity(0.25))
                                ]),
                            child: Center(
                              child: Text(
                                'Pesan',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image(
                      image:
                          AssetImage('assets/images/menu_makanan/padang.png'),
                      width: 220,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
