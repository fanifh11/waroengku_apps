import 'package:flutter/material.dart';
import 'package:waroengku_app/detail/detail_menu.dart';

class KontenHeader extends StatelessWidget {
  const KontenHeader({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailMenu widget;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Image.asset(widget.makanan.gambarDalam)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Kembali(),
                // const FavoriteButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
