import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waroengku_app/detail_menu.dart';
import 'package:waroengku_app/home.dart';
import 'package:waroengku_app/main.dart';
import 'package:waroengku_app/model/model_makanan.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(children: [
            Container(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    'Menu',
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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
                                fontSize: 30,
                                color: Color.fromARGB(255, 94, 168, 128),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]),
            ),
            Container(
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
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 1,
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
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
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
                                          color:
                                              Colors.black26.withOpacity(0.25))
                                    ]),
                                child: Center(
                                  child: Text(
                                    'Pesan Sekarang',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage(
                                  'assets/images/menu_makanan/padang.png'),
                              width: 220,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  color: Color.fromRGBO(234, 241, 239, 1),
                  child: Center(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final MenuMakanan makanan = menuMakananList[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailMenu(
                                    makanan: makanan,
                                  );
                                }));
                              },
                              child: Card(
                                margin: EdgeInsets.all(10),
                                elevation: 5,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(14),
                                        child: Image.asset(makanan.imageAsset),
                                        height: 100,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            makanan.nama,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star_rate,
                                                color: Colors.amber,
                                              ),
                                              Text(" "),
                                              Text(makanan.rating),
                                              Text(" "),
                                              Icon(Icons.attach_money_rounded),
                                              Text("${makanan.harga}")
                                            ],
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            );
                          },
                          itemCount: menuMakananList.length,
                        ),
                        // Sampel ListVie Builder
                      ],
                    ),
                  )),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
