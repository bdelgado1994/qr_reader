import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrreader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
export 'package:qrreader/models/scan_model.dart';

class DBProvider {
  static Database? _dataBase;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_dataBase != null) return _dataBase;

    _dataBase = await initDB();
    return _dataBase;
  }

  Future<Database?> initDB() async {
    //path de donde se almacenara la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDb.db');
    debugPrint(path);
    //crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE Scans(
        id INTEGER PRIMARY KEY,
        tipo TEXT,
        valor TEXT
      )
''');
      },
    );
  }

//Forma uno de insertar
  Future<int> newScanRaw(ScanModel newScan) async {
    //verificar la base de datos
    final db = await database;
    //
    final res = await db!.rawInsert('''
        INSERT INTO Scans (id,tipo,valor) 
        VALUES(${newScan.id},'${newScan.tipo}','${newScan.valor}')
''');
    return res;
  }

  Future newScan(ScanModel newScanModel) async {
    final db = await database;
    //
    final res = await db!.insert('Scans', newScanModel.toJson());
    return res;
  }
}
