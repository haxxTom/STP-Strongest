import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/database/exercises.dart';
import 'exercisesList.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final Trenink trenink;

  WorkoutDetailScreen({required this.trenink});

  @override
  _WorkoutDetailScreenState createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.trenink.nazev),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          ...widget.trenink.exercises.map((exercise) {
            return ListTile(
              leading: Image.asset(exercise.cvik.obrazek),
              title: Text(exercise.cvik.nazev),
              subtitle: Text(exercise.cvik.popis),
              onTap: () {
                _addSetDialog(exercise);  // Přidání sérií pro tento cvik
              },
            );
          }).toList(),
          ListTile(
            title: Text("Přidat cvik"),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _addExerciseDialog(context, widget.trenink);  // Přidání cviku
              },
            ),
          ),
        ],
      ),
    );
  }

  // Funkce pro přidání sérií (po kliknutí na cvik)
  void _addSetDialog(Exercise exercise) {
    final repsController = TextEditingController();
    final weightController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Přidat sérii pro ${exercise.cvik.nazev}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: repsController,
                decoration: InputDecoration(labelText: "Opakování"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(labelText: "Váha (kg)"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Zrušit"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  addSet(
                    exercise,
                    int.parse(repsController.text),
                    double.parse(weightController.text),
                  );
                });
                Navigator.pop(context);
              },
              child: Text("Přidat"),
            ),
          ],
        );
      },
    );
  }

  // Funkce pro přidání cviku z dialogu
  void _addExerciseDialog(BuildContext context, Trenink trenink) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Vyberte cvik"),
          content: SizedBox(
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: cviky.length,  // List cviků (může být z databáze)
              itemBuilder: (context, index) {
                final cvik = cviky[index];
                return ListTile(
                  leading: Image.asset(cvik.obrazek),
                  title: Text(cvik.nazev),
                  subtitle: Text(cvik.partie),
                  onTap: () {
                    addExerciseFromList(trenink, cvik.id);  // Přidání cviku do tréninku
                    Navigator.pop(context);  // Zavření dialogu
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
