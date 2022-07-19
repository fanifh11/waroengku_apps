import 'package:waroengku_app/menu/menu.dart';

class MenuMakanan {
  String nama;
  double harga;
  String deskripsi;
  String rating;
  String imageAsset;
  String gambarDalam;

  MenuMakanan(
      {required this.nama,
      required this.harga,
      required this.deskripsi,
      required this.rating,
      required this.imageAsset,
      required this.gambarDalam});
}

var menuMakananList = [
  MenuMakanan(
      nama: 'Rendang',
      harga: 20000,
      deskripsi: 'Rendang adalah makanan enak',
      rating: '5',
      imageAsset: 'assets/images/menu_makanan/rendang.png',
      gambarDalam: 'assets/images/tampak_dalam/7.png'),
  MenuMakanan(
      nama: 'Soto Daging',
      harga: 25000,
      deskripsi: 'Soto daging adalah makanan enak',
      rating: '4.20',
      imageAsset: 'assets/images/menu_makanan/soto_daging.png',
      gambarDalam: 'assets/images/tampak_dalam/3.png'),
  MenuMakanan(
      nama: 'Pecel',
      harga: 10000,
      deskripsi: 'Pecel adalah makanan enak',
      rating: '4.75',
      imageAsset: 'assets/images/menu_makanan/pecel.png',
      gambarDalam: 'assets/images/tampak_dalam/4.png'),
  MenuMakanan(
      nama: 'Gado-gado',
      harga: 15000,
      deskripsi: 'Gado-gado adalah makanan enak',
      rating: '4.6',
      imageAsset: 'assets/images/menu_makanan/gado_gado.png',
      gambarDalam: 'assets/images/tampak_dalam/2.png'),
  MenuMakanan(
      nama: 'Mie Ayam',
      harga: 12000,
      deskripsi: 'Mie ayam adalah makanan enak',
      rating: '5',
      imageAsset: 'assets/images/menu_makanan/mi_ayam.png',
      gambarDalam: 'assets/images/tampak_dalam/6.png'),
  MenuMakanan(
      nama: 'Pempek',
      harga: 50000,
      deskripsi: 'Pempek adalah makanan enak',
      rating: '5',
      imageAsset: 'assets/images/menu_makanan/pempek.png',
      gambarDalam: 'assets/images/tampak_dalam/5.png'),
  MenuMakanan(
      nama: 'Soto Ayam',
      harga: 20000,
      deskripsi: 'Soto ayam adalah makanan enak',
      rating: '5',
      imageAsset: 'assets/images/menu_makanan/soto_ayam.png',
      gambarDalam: 'assets/images/tampak_dalam/1.png'),
];
