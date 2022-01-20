// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobilepocketapp/data/local_data/local_data_list.dart';
import 'package:mobilepocketapp/etc/slicing/home_view.dart';

class DompetScreen extends StatelessWidget {
  DompetScreen({Key? key}) : super(key: key);
  List itemTitleDompet = ["Dompet Utama", "Dompet Tambahan", "Dompet Cadangan"];
  List itemNoRekDompet = ["1312312412", "3432435131", "423424524"];
  List itemNamaBankDompet = ["Bank BCA", "Bank BRI", "Bank Mandiri"];
  List itemStatusDompet = ["Aktif", "Tidak Aktif", "Aktif"];
  List detailTitle = ["Nama", "Refensi", "Deskripsi", "Status"];
  final provider = LocalDataList.instance;

  @override
  Widget build(BuildContext context) {
    return HomeViewSlicing(
      nama: itemTitleDompet,
      referensi: itemNoRekDompet,
      deskripsi: itemNamaBankDompet,
      status: itemStatusDompet,
      detailTitle: detailTitle,
    );
  }
}
