import 'package:flutter/cupertino.dart';

/// index 0 = nama, index 1 = no ref, index 2 = deskripsi, index 3 = status
class LocalDataList with ChangeNotifier {
  LocalDataList._();
  static final instance = LocalDataList._();
  List dataDompet = [[], [], [], []];

  List getDataDompet() => dataDompet;

  updatedataDompet(List updataDompet) {
    dataDompet = updataDompet;

    notifyListeners();
  }
}
