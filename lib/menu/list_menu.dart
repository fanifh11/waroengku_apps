import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waroengku_app/detail/detail_menu.dart';
import 'package:waroengku_app/model/model_makanan.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                              children: [
                                Expanded(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.all(14),
                                            child:
                                                Image.asset(makanan.imageAsset),
                                            height: 100,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Column(
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
                                                  Icon(Icons
                                                      .attach_money_rounded),
                                                  Text('Rp. ' +
                                                      (makanan.harga.toInt())
                                                          .toString())
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ),
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
        ),
      ],
    );
  }
}
