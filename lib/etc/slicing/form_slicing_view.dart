// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilepocketapp/data/arguments/detail_argument_dompet.dart';
import 'package:mobilepocketapp/data/local_data/local_data_list.dart';
import 'package:mobilepocketapp/module/dompet/dompet_screen.dart';
import 'package:provider/provider.dart';

class FormSlicingView extends StatefulWidget {
  final DetailDompetArguments? arguments;
  static const routeName = "/tambah";
  const FormSlicingView({Key? key, this.arguments}) : super(key: key);

  @override
  _FormSlicingViewState createState() => _FormSlicingViewState();
}

class _FormSlicingViewState extends State<FormSlicingView> {
  GlobalKey<FormState> formKey = GlobalKey();
  List detailTitle = ["Nama", "Refensi", "Deskripsi", "Status"];
  TextEditingController namaController = TextEditingController();
  TextEditingController referensiController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  final provider = LocalDataList.instance;
  bool statusError = false;
  List result = [];

  @override
  Widget build(BuildContext context) {
    final arguments = widget.arguments;
    return Scaffold(
      appBar: AppBar(
        title: arguments!.statusEdit
            ? Text("Edit Kartu")
            : Text("Tambah Kartu Baru"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(child: Text(detailTitle[0])),
                          createFormField(namaController, arguments.nama)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(child: Text(detailTitle[1])),
                          createFormField(
                              referensiController, arguments.referensi)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(child: Text(detailTitle[2])),
                          createFormField(
                              deskripsiController, arguments.deskripsi)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(child: Text(detailTitle[3])),
                          createFormField(statusController, arguments.status)
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            result.addAll([
                              [namaController.value.text],
                              [referensiController.value.runtimeType],
                              [deskripsiController.value.text],
                              [statusController.value.text]
                            ]);
                            provider.updatedataDompet(result);
                            Navigator.pop(context);
                            // DompetScreen()
                            //     .itemTitleDompet
                            //     .add(namaController.value.text);
                            // DompetScreen()
                            //     .itemNoRekDompet
                            //     .add(referensiController.value.text);
                            // DompetScreen()
                            //     .itemNamaBankDompet
                            //     .add(deskripsiController.value.text);
                            // DompetScreen()
                            //     .itemStatusDompet
                            //     .add(statusController.value.text);
                            // Navigator.pop(context);
                            // arguments.statusEdit
                            //     ? DompetScreen()
                            //             .itemTitleDompet
                            //             .contains(arguments.nama)

                            //         // ignore: unrelated_type_equality_checks
                            //         ? DompetScreen()
                            //                     .itemTitleDompet
                            //                     .contains(arguments.nama) ==
                            //                 namaController.value.text
                            //             ? statusError = true
                            //             : statusError = false
                            //         : DompetScreen().itemTitleDompet.indexWhere(
                            //             (element) => element == arguments.nama)
                            //     : DompetScreen()
                            //         .itemTitleDompet
                            //         .add(namaController.value.text);
                          });
                        },
                        child: arguments.statusEdit
                            ? Text("Ubah")
                            : Text("Simpan"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createFormField(TextEditingController controller, String hintText) {
    final arguments = widget.arguments;
    return SizedBox(
      width: 150,
      height: 30,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: arguments!.statusEdit ? hintText : "",
            contentPadding: EdgeInsets.only(left: 5),
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder()),
        controller: controller,
      ),
    );
  }
}
