import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waroengku_app/menu/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(206, 240, 232, 1),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      // height: 200,
                      child: Image.asset("assets/images/home/Waroengku.png")),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Flexible(
                    flex: 1,
                    child: Text(
                      'Selamat datang di',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    )),
              ),
            ),
            Flexible(
                flex: 2,
                child: Text('WAROENGKU',
                    style: GoogleFonts.poppins(
                        height: 1, fontWeight: FontWeight.bold, fontSize: 20))),
            Flexible(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Flexible(
                      child: Text('"Semua dapat makan enak"',
                          style: GoogleFonts.montserrat(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              fontSize: 12)))),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Menu();
                  }));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  // padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.25))
                      ]),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pesan Sekarang",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)))
                        ]),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
