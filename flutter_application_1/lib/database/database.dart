import 'exercisesList.dart';
import 'database.dart';
import '../templates.dart';
import 'dart:convert';

class Cvik {
  int id;
  String nazev;
  String partie;
  String obrazek;
  String popis;
  //List<int>? lastPerformances;
  

  Cvik({required this.id, required this.nazev, required this.partie, required this.obrazek, required this.popis});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nazev': nazev,
      'partie': partie,
      'obrazek': obrazek,
      'popis': popis,
    };
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nazev': nazev,
      'obrazek': obrazek,
      'partie': partie,
    };
  }

  static Cvik fromJson(Map<String, dynamic> json) {
    return Cvik(
      id: json['id'] is int 
          ? json['id'] 
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      nazev: json['nazev'] ?? '',
      obrazek: json['obrazek'] ?? '',
      partie: json['partie'] ?? '',
      popis: json['popis'] ?? '',
    );
  }
  Map<String, dynamic> toMapWithoutId() {
    return {
      'nazev': nazev,
      'partie': partie,
      'obrazek': obrazek,
      'popis': popis,
    };
  }
  factory Cvik.fromMap(Map<String, dynamic> map) {
    return Cvik(
      id: map['id'],
      nazev: map['nazev'],
      partie: map['partie'],
      obrazek: map['obrazek'],
      popis: map['popis'],
    );
  }


  Cvik copyWith({int? id, String? nazev, String? partie, String? obrazek, String? popis}) {
    return Cvik(
      id: id ?? this.id,
      nazev: nazev ?? this.nazev,
      partie: partie ?? this.partie,
      obrazek: obrazek ?? this.obrazek,
      popis: popis ?? this.popis
    );
  }
}

class Trenink {
  String nazev;
  List<Exercise> exercises = [];
  DateTime startTime;
  DateTime? endTime;

  Trenink({
    required this.nazev,
    required this.startTime,
    this.endTime,
  });

  Duration get duration {
    if (endTime != null) {
      return endTime!.difference(startTime);
    }
    return DateTime.now().difference(startTime);
  }

  // Metoda toJson pro serializaci
  Map<String, dynamic> toJson() {
    return {
      'nazev': nazev,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
    };
  }

  // Metoda fromJson pro deserializaci
  static Trenink fromJson(Map<String, dynamic> json) {
    return Trenink(
      nazev: json['nazev'],
      startTime: DateTime.parse(json['startTime']),
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
    )..exercises = (json['exercises'] as List)
        .map((exerciseJson) => Exercise.fromJson(exerciseJson))
        .toList();
  }
}

void addExerciseFromList(Trenink trenink, int cvikId) {
  // Vyhledání cviku podle ID
  final cvik = cviky.firstWhere((c) => c.id == cvikId);
  final exercise = Exercise(cvik: cvik);
  trenink.exercises.add(exercise);
}

List<Trenink> treninky = [];

Trenink startNewWorkout(String nazev) {
  final trenink = Trenink(nazev: nazev, startTime: DateTime.now());
  treninky.add(trenink);
  return trenink;
}

Trenink? activeWorkout;

void addSet(Exercise exercise, int reps, double weight) {
  final set = Set(reps: reps, weight: weight);
  exercise.sets.add(set);
}

void endWorkout(Trenink trenink) {
  trenink.endTime = DateTime.now();
}

class Exercise {
  Cvik cvik;
  List<Set> sets = [];

  Exercise({required this.cvik});

  // Metoda toJson pro serializaci
  Map<String, dynamic> toJson() {
    return {
      'cvik': cvik.toJson(),
      'sets': sets.map((set) => set.toJson()).toList(),
    };
  }

  // Metoda fromJson pro deserializaci
  static Exercise fromJson(Map<String, dynamic> json) {
    return Exercise(
      cvik: Cvik.fromJson(json['cvik']),
    )..sets = (json['sets'] as List)
        .map((setJson) => Set.fromJson(setJson))
        .toList();
  }
}
Map<int, List<bool>> completedSets = {}; // Klíč: index cvičení, Hodnota: seznam bool hodnot pro série

class Set {
  int reps;
  double weight;

  Set({required this.reps, required this.weight});

  // Metoda toJson pro serializaci
  Map<String, dynamic> toJson() {
    return {
      'reps': reps,
      'weight': weight,
    };
  }

  // Metoda fromJson pro deserializaci
  static Set fromJson(Map<String, dynamic> json) {
    return Set(
      reps: json['reps'] is int 
          ? json['reps'] 
          : int.tryParse(json['reps'].toString()) ?? 0,
      weight: json['weight'] is double 
          ? json['weight'] 
          : double.tryParse(json['weight'].toString()) ?? 0.0,
    );
  }
}

