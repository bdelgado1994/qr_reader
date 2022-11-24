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
  final String tableName = 'Scans';

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
      CREATE TABLE $tableName(
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
        INSERT INTO $tableName (id,tipo,valor) 
        VALUES(${newScan.id},'${newScan.tipo}','${newScan.valor}')
''');
    return res;
  }

  Future newScan(ScanModel newScanModel) async {
    final db = await database;
    //
    final res = await db!.insert(tableName, newScanModel.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    //
    final res = await db!.query(tableName, where: 'id=?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getAllScan() async {
    final db = await database;
    //
    final res = await db!.query(tableName);
    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : null;
  }

  Future<List<ScanModel>?> getScanByTipo(String type) async {
    final db = await database;
    final res = await db!.query(tableName, where: 'tipo=?', whereArgs: [type]);

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : null;
  }

  Future<int> updateScanById(ScanModel scan) async {
    final db = await database;
    //
    final res = db!
        .update(tableName, scan.toJson(), where: "id=?", whereArgs: [scan.id]);
    return res;
  }

  Future<int> deleteScanById(int idScan) async {
    final Database? db = await database;
    //
    final int res =
        await db!.delete(tableName, where: 'id=?', whereArgs: [idScan]);
    return res;
  }

  Future<int> deleteAllScan() async {
    final Database? db = await database;
    //
    final int res = await db!.rawDelete('''
      DELETE FROM $tableName
''');

    return res;
  }
}
