import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Training {
  int id;
  String name;
  String date;
  String notes;

  Training({required this.id, required this.name, required this.date, required this.notes});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'notes': notes,
    };
  }

  factory Training.fromMap(Map<String, dynamic> map) {
    return Training(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      notes: map['notes'],
    );
  }
}

class TrainingPreset {
  int id;
  String name;
  String description;

  TrainingPreset({required this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory TrainingPreset.fromMap(Map<String, dynamic> map) {
    return TrainingPreset(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}

class CurrentTraining {
  int id;
  String name;
  String startTime;

  CurrentTraining({required this.id, required this.name, required this.startTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'startTime': startTime,
    };
  }

  factory CurrentTraining.fromMap(Map<String, dynamic> map) {
    return CurrentTraining(
      id: map['id'],
      name: map['name'],
      startTime: map['startTime'],
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _db;

  DatabaseHelper._internal();

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDatabase();
    }
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'sport_records.db');

    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE trainings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            date TEXT NOT NULL,
            notes TEXT
          );
        ''');

        await db.execute('''
          CREATE TABLE training_presets (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT
          );
        ''');

        await db.execute('''
          CREATE TABLE current_training (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            startTime TEXT NOT NULL
          );
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE current_training (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              startTime TEXT NOT NULL
            );
          ''');
        }
      },
    );
  }

  Future<int> insertTraining(Training training) async {
    final dbClient = await db;
    return await dbClient.insert('trainings', training.toMap());
  }

  Future<List<Training>> getAllTrainings() async {
    final dbClient = await db;
    final maps = await dbClient.query('trainings');
    return maps.map((map) => Training.fromMap(map)).toList();
  }

  Future<void> deleteTraining(int id) async {
    final dbClient = await db;
    await dbClient.delete('trainings', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertTrainingPreset(TrainingPreset preset) async {
    final dbClient = await db;
    return await dbClient.insert('training_presets', preset.toMap());
  }

  Future<List<TrainingPreset>> getAllPresets() async {
    final dbClient = await db;
    final maps = await dbClient.query('training_presets');
    return maps.map((map) => TrainingPreset.fromMap(map)).toList();
  }

  Future<void> deletePreset(int id) async {
    final dbClient = await db;
    await dbClient.delete('training_presets', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> startNewTraining(CurrentTraining training) async {
    final dbClient = await db;
    await dbClient.delete('current_training'); // Remove any existing training
    return await dbClient.insert('current_training', training.toMap());
  }

  Future<CurrentTraining?> getCurrentTraining() async {
    final dbClient = await db;
    final maps = await dbClient.query('current_training');
    if (maps.isNotEmpty) {
      return CurrentTraining.fromMap(maps.first);
    }
    return null;
  }

  Future<void> endCurrentTraining() async {
    final dbClient = await db;
    await dbClient.delete('current_training');
  }
}
