import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fl_qr_scanner/model/scan_model.dart';

class DBProvider {
  static dynamic _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    Database database = await initDataBase();
    return database;
  }

  Future<Database> initDataBase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'ScansDB.db');
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int index) async {
        await db.execute('''
          CREATE TABLE Scans (
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            value TEXT 
          )
        ''');
      },
    );
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final db = await database;

    final res = await db.rawInsert(
        '''INSERT INTO Scans (id, tipo, value) VALUE (${newScan.id}, '${newScan.tipo}', '${newScan.value}')''');

    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getListScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<List<ScanModel>> getListScansByTipo(String tipo) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<int> updateScans(ScanModel newScan) async {
    final db = await database;
    final res = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);

    return res;
  }

  Future<int> deleteScanById(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteScans() async {
    final db = await database;
    final res = await db.delete('Scans');

    return res;
  }
}
