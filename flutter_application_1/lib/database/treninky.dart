import 'exercisesList.dart';
import 'database.dart';
import '../templates.dart';
class Trenink{
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
}
void addExerciseFromList(Trenink trenink, int cvikId) {
  // Vyhledání cviku podle ID
  final cvik = cviky.firstWhere((c) => c.id == cvikId);
  final exercise = Exercise(cvik: cvik);
  trenink.exercises.add(exercise);
}
List<Trenink> treninky = [];

List<Trenink> trenink = [];
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
}
class Set {
  int reps;
  double weight;

  Set({required this.reps, required this.weight});
}

