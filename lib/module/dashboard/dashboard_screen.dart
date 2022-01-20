// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilepocketapp/data/arguments/detail_argument_dompet.dart';
import 'package:mobilepocketapp/etc/slicing/form_slicing_view.dart';
import 'package:mobilepocketapp/module/dompet/dompet_screen.dart';
import 'package:mobilepocketapp/module/kategori/kategori_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool searchStatus = false;
  int statusPage = 0;
  List itemTitle = ["Master", "Transaksi", "Laporan"];
  List itemIcon = [Icons.home, Icons.money, Icons.report];
  List itemMasterTitle = ["Dompet", "Kategori"];
  List itemTransakiTitle = ["Dompet Masuk", "Dompet Keluar"];
  TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchStatus
            ? TextField(
                style: TextStyle(color: Colors.white),
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "search",
                    hintStyle: TextStyle(color: Colors.white)),
              )
            : Text(
                "Dompet {nama anda}",
                style: TextStyle(fontSize: 15),
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  searchStatus = !searchStatus;
                });
              },
              icon: searchStatus ? Icon(Icons.close) : Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FormSlicingView.routeName,
              arguments: DetailDompetArguments(
                  nama: "",
                  referensi: "",
                  deskripsi: "",
                  status: "",
                  statusEdit: false,
                  titlePage: '',
                  detailTitle: []));
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: statusPage == 0
              ? DompetScreen()
              : statusPage == 1
                  ? KategoriScreen()
                  : Container()),
      drawer: Drawer(
          child: ListView(
        children: [
          _createHeader(),
          for (var i = 0; i < 3; i++)
            _createDrawerItem(itemTitle[i], itemIcon[i], i)
        ],
      )),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.blue),
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Text(
                  "Dompet Mu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ))
          ],
        ));
  }

  Widget _createDrawerItem(String text, IconData icon, int i) {
    return ExpansionTile(
      title: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        if (i == 0)
          for (var y = 0; y < 2; y++)
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                title: Text(itemMasterTitle[y]),
                onTap: () {
                  if (y == 0) {
                    setState(() {
                      statusPage = 0;
                    });
                  }
                  if (y == 1) {
                    setState(() {
                      statusPage = 1;
                    });
                  }
                },
              ),
            ),
        if (i == 1)
          for (var y = 0; y < 2; y++)
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                title: Text(itemTransakiTitle[y]),
                onTap: () {},
              ),
            ),
        if (i == 2)
          for (var y = 0; y < 1; y++)
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                title: Text("Laporan Transaksi"),
                onTap: () {},
              ),
            ),
      ],
      //onTap: onTap,
    );
  }
}
