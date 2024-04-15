import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

class DatabaseHelper {

  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _db;

  DatabaseHelper._internal();

  FutureOr<Database> get db {
    if (_db == null) {
      return _initDatabase(); 
    } else {
      return _db!; 
    }
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'cviky.db');

    return openDatabase(path,
        version: 1,
        onOpen: (db) {
          db.execute('CREATE TABLE cviky (id INTEGER PRIMARY KEY AUTOINCREMENT, nazev TEXT NOT NULL, partie TEXT NOT NULL, obrazek TEXT)');
        },
        onCreate: (db, version) {
          // V případě potřeby zde můžete provést další inicializaci databáze
        });
  }


  Future<Cvik> insertCvik(Cvik cvik) async {
    final db = await instance.db;
    final id = await db.insert('cviky', cvik.toMap());
    return cvik.copyWith(id: id);
  }

  Future<List<Cvik>> getAllCvici() async {
    final db = await instance.db;
    final maps = await db.query('cviky');
    return List.generate(maps.length, (i) => Cvik.fromMap(maps[i]));
  }

  Future<Cvik> getCvikById(int id) async {
    final db = await instance.db;
    final maps = await db.query('cviky', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Cvik.fromMap(maps.first);
    } else {
      throw Exception('Cvik s ID $id nenalezen');
    }
  }

  Future<void> updateCvik(Cvik cvik) async {
    final db = await instance.db;
    await db.update('cviky', cvik.toMap(), where: 'id = ?', whereArgs: [cvik.id]);
  }

  Future<void> deleteCvik(int id) async {
    final db = await instance.db;
    await db.delete('cviky', where: 'id = ?', whereArgs: [id]);
  }
}
