import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qrreader/models/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan(String valor) async {
    final newScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(newScan);
    //Asignar el ID de la base de datos al modelo
    newScan.id = id;
    if (selectedType == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  loadScans() async {
    final loadedScans = await DBProvider.db.getAllScan();
    scans = [...?loadedScans];
    notifyListeners();
  }

  loaddingScansByType(String type) async {
    final loadedScans = await DBProvider.db.getScanByTipo(type);
    scans = [...?loadedScans];
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  deleteById(int idScan) async {
    await DBProvider.db.deleteScanById(idScan);
  }
}
