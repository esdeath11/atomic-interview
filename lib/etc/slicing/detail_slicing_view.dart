// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobilepocketapp/data/arguments/detail_argument_dompet.dart';

class DetailSlicingView extends StatelessWidget {
  static const routeName = "/detail";

  DetailSlicingView({Key? key, required this.arguments}) : super(key: key);
  List detailValue = [];
  final DetailDompetArguments? arguments;
  @override
  Widget build(BuildContext context) {
    detailValue.addAll([
      arguments!.nama,
      arguments!.referensi,
      arguments!.deskripsi,
      arguments!.status
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments!.titlePage),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Expanded(child: Text(arguments!.detailTitle[i])),
                      Expanded(child: Text(detailValue[i])),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
