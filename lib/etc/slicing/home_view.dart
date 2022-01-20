// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilepocketapp/data/arguments/detail_argument_dompet.dart';
import 'package:mobilepocketapp/etc/slicing/detail_slicing_view.dart';
import 'package:mobilepocketapp/etc/slicing/form_slicing_view.dart';

class HomeViewSlicing extends StatelessWidget {
  final List nama, referensi, deskripsi, status, detailTitle;

  const HomeViewSlicing({
    Key? key,
    required this.nama,
    required this.referensi,
    required this.deskripsi,
    required this.status,
    required this.detailTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(delegate: Delegate()),
        SliverList(
            delegate: SliverChildListDelegate([
          for (var i = 0; i < nama.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ExpansionTile(
                title: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            nama[i],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              referensi[i],
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Text(
                            deskripsi[i],
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            status[i],
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, DetailSlicingView.routeName,
                            arguments: DetailDompetArguments(
                                nama: nama[i],
                                referensi: referensi[i],
                                deskripsi: deskripsi[i],
                                status: status[i],
                                statusEdit: false,
                                titlePage: 'Detail',
                                detailTitle: detailTitle));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.search),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Detail"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, FormSlicingView.routeName,
                            arguments: DetailDompetArguments(
                                nama: nama[i],
                                referensi: referensi[i],
                                deskripsi: deskripsi[i],
                                status: status[i],
                                statusEdit: true,
                                titlePage: 'Ubah',
                                detailTitle: []));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.edit),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Edit"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.no_encryption),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Tidak Aktif"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ]))
      ],
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  List itemTitleDelegate = ["Semua", "Aktif", "Tidak Aktif"];
  List itemValueDelegateDummy = [2, 5, 0];
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      children: [
        for (var i = 0; i < 3; i++)
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    border: Border.all(color: Colors.white)),
                width: 200,
                height: 50,
                child: Center(
                  child: Text(
                    "${itemTitleDelegate[i]} ( ${itemValueDelegateDummy[i]} )",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
