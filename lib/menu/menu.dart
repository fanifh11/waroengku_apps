import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waroengku_app/detail/detail_menu.dart';
import 'package:waroengku_app/main.dart';
import 'package:waroengku_app/menu/fav_menu.dart';
import 'package:waroengku_app/menu/header_menu.dart';
import 'package:waroengku_app/menu/list_menu.dart';
import 'package:waroengku_app/model/model_makanan.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(children: [
            HeaderMenu(),
            FavMenu(makanan: menuMakananList[0]),
            ListMenu()
          ]),
        ),
      ),
    );
  }
}
