import 'package:flutter/material.dart';
import 'package:waroengku_app/detail_menu.dart';
import 'package:waroengku_app/menu.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(25),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Color.fromRGBO(234, 241, 239, 1),
                    child: Column(
                      children: [
                        Container(
                          child: Positioned(
                            bottom: 290,
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Container(
                                margin: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                          color: Colors.black.withOpacity(0.25))
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                        child: Image.asset(
                                            "assets/images/tampak_dalam/SplashScreen.png"))
                                  ],
                                )),
                          ),
                        ),
                        Container(
                            child: Column(
                          children: [
                            Text(
                              'Selamat datang di restoran',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              'WAROENGKU',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      fontSize: 35)),
                            ),
                            Text(
                              'Sejak 2022',
                            ),
                            Text(
                              '"Semua dapat makan enak"',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      height: 2,
                                      fontSize: 20)),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Menu();
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 50),
                                width: 350,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(206, 240, 232, 1),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                          color: Colors.black.withOpacity(0.25))
                                    ]),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("CARI MENU SEKARANG",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)))
                                    ]),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
