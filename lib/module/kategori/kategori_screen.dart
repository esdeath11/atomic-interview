// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobilepocketapp/etc/slicing/home_view.dart';

class KategoriScreen extends StatelessWidget {
  KategoriScreen({Key? key}) : super(key: key);
  List namaKategori = ["Pemasukan", "Pengeluaran", "Lain - lain"];
  List deskripsiKategori = [
    "Kategori untuk keperluan Pemasukan uang",
    "Kategori untuk keperluan Pengeluaran uang",
    "Kategori lain - lain"
  ];
  List tujuanKategori = ["", "", ""];
  List statusKategori = ["aktif", "aktif", "aktif"];
  List detailTitle = ["Nama", "Refensi", "Deskripsi", "Status"];

  @override
  Widget build(BuildContext context) {
    return HomeViewSlicing(
      nama: namaKategori,
      referensi: deskripsiKategori,
      deskripsi: tujuanKategori,
      status: statusKategori,
      detailTitle: detailTitle,
    );
  }
}
