import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';
import 'exercisesList.dart';

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
    version: 2,  // Zvyš verzi databáze
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE cviky (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nazev TEXT NOT NULL,
          partie TEXT NOT NULL,
          obrazek TEXT,
          popis TEXT NOT NULL
        )
      ''');
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      // Pokud verze byla nižší než 2, přidáme sloupec 'popis'
      if (oldVersion < 2) {
        await db.execute('ALTER TABLE cviky ADD COLUMN popis TEXT');
      }
    },
  );
}


  Future<Cvik> insertCvik(Cvik cvik) async {
  final db = await instance.db;
  // Nezahrnuj id v insertu, necháme SQLite generovat auto-increment ID
  final id = await db.insert('cviky', cvik.toMapWithoutId());
  return cvik.copyWith(id: id); // Aktualizuj objekt Cvik s novým ID
  }


  Future<List<Cvik>> getAllCviky() async {
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

  Future<void> insertCvikyList(List<Cvik> cvikyList) async {
  final db = await instance.db;
  final batch = db.batch();  
  for (var cvik in cvikyList) {
    batch.insert('cviky', cvik.toMapWithoutId());  
  }
  await batch.commit();
  }
}

Future<void> initializeDatabase() async {
  final db = await DatabaseHelper.instance.db;

  // Zkontroluj, zda tabulka 'cviky' je prázdná (nebo zkontroluj existenci dat)
  final result = await db.query('cviky');
  if (result.isEmpty) {
    // Pokud je tabulka prázdná, vlož výchozí cviky
    await DatabaseHelper.instance.insertCvikyList(cviky);
    print("Výchozí cviky byly přidány do databáze.");
  } else {
    print("Cviky již byly v databázi.");
  }
}

