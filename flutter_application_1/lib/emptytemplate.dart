import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_application_1/database/exercisesList.dart'; // Obsahuje seznam cviků (globální proměnná např. cviky)
import 'package:flutter_application_1/database/database.dart';
import '../templates.dart'; 

// Vytvoříme model pro šablonu – obsahuje pouze název a seznam cvičení (každé s vlastními sériemi)
class WorkoutTemplate {
  String nazev;
  List<Exercise> exercises;

  WorkoutTemplate({required this.nazev, required this.exercises});

  Map<String, dynamic> toJson() {
    return {
      'nazev': nazev,
      'exercises': exercises.map((e) => e.toJson()).toList(),
    };
  }

  factory WorkoutTemplate.fromJson(Map<String, dynamic> json) {
    return WorkoutTemplate(
      nazev: json['nazev'],
      exercises: (json['exercises'] as List)
          .map((exerciseJson) => Exercise.fromJson(exerciseJson))
          .toList(),
    );
  }
}

class TemplateWorkoutScreen extends StatefulWidget {
  const TemplateWorkoutScreen({Key? key}) : super(key: key);

  @override
  _TemplateWorkoutScreenState createState() => _TemplateWorkoutScreenState();
}

class _TemplateWorkoutScreenState extends State<TemplateWorkoutScreen> {
  // Řídící pole pro název šablony
  TextEditingController _titleController =
      TextEditingController(text: "Nová šablona");
  bool _isEditingTitle = false;

  // Klíč: index cvičení v šabloně, hodnota: seznam řídících objektů pro každou sérii
  Map<int, List<Map<String, dynamic>>> setControllers = {};
  // Seznam cvičení v šabloně
  List<Exercise> exercises = [];

  // Proměnné pro vyhledávání při výběru cviku
  bool _showSearchBar = false;
  FocusNode _focusNode = FocusNode();
  String _searchText = "";
  List<Cvik> _filteredCviky = cviky; // Předpokládáme, že cviky je definováno v souboru exercisesList.dart

  void _toggleTitleEdit() {
    setState(() {
      _isEditingTitle = !_isEditingTitle;
    });
  }

  /// Dialog pro výběr cviku z globálního seznamu
  void _addExerciseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setStateDialog) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text("Vyberte cvik", style: TextStyle(color: Colors.white)),
            content: SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: FloatingActionButton(
                          backgroundColor: Colors.blueGrey,
                          onPressed: () {
                            setStateDialog(() {
                              _showSearchBar = !_showSearchBar;
                              if (_showSearchBar) {
                                _focusNode.requestFocus();
                              } else {
                                _focusNode.unfocus();
                                _searchText = "";
                                _filteredCviky = cviky;
                              }
                            });
                          },
                          child: Icon(
                            _showSearchBar ? Icons.close : Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (_showSearchBar)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              cursorColor: Colors.white,
                              style: const TextStyle(color: Colors.white),
                              focusNode: _focusNode,
                              onChanged: (value) {
                                setStateDialog(() {
                                  _searchText = value;
                                  _filteredCviky = cviky
                                      .where((cvik) => cvik.nazev
                                          .toLowerCase()
                                          .contains(_searchText.toLowerCase()))
                                      .toList();
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Search Exercises",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white, width: 3),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _showSearchBar ? _filteredCviky.length : cviky.length,
                      itemBuilder: (context, index) {
                        final cvik = _showSearchBar ? _filteredCviky[index] : cviky[index];
                        return ListTile(
                          leading: Image.asset(cvik.obrazek),
                          title: Text(cvik.nazev,
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(cvik.partie,
                              style: TextStyle(color: Colors.white70)),
                          onTap: () {
                            setState(() {
                              // Vytvoříme nové cvičení s prázdným seznamem sérií
                              Exercise exercise = Exercise(cvik: cvik);
                              exercises.add(exercise);
                              int exerciseIndex = exercises.length - 1;
                              _addSet(exerciseIndex);
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  /// Přidá novou sérii ke cvičení na zadaném indexu
  void _addSet(int exerciseIndex) {
    setState(() {
      if (!setControllers.containsKey(exerciseIndex)) {
        setControllers[exerciseIndex] = [];
      }
      var weightController = TextEditingController();
      var repsController = TextEditingController();
      setControllers[exerciseIndex]!.add({
        'weight': weightController,
        'reps': repsController,
      });
      // Přidáme prázdnou sadu do modelu cvičení (hodnoty se později aktualizují)
      if (exerciseIndex < exercises.length) {
        exercises[exerciseIndex].sets.add(Set(reps: 0, weight: 0));
      }
    });
  }

  void _deleteSet(int exerciseIndex, int setIndex) {
    setState(() {
      setControllers[exerciseIndex]?.removeAt(setIndex);
      if (exerciseIndex < exercises.length) {
        exercises[exerciseIndex].sets.removeAt(setIndex);
      }
    });
  }

  void _deleteExercise(int exerciseIndex) {
    setState(() {
      if (exerciseIndex < exercises.length) {
        exercises.removeAt(exerciseIndex);
        setControllers.remove(exerciseIndex);
        // Přerezervování indexů v mapě
        Map<int, List<Map<String, dynamic>>> newControllers = {};
        for (int i = 0; i < exercises.length; i++) {
          newControllers[i] = setControllers[i] ?? [];
        }
        setControllers = newControllers;
      }
    });
  }

  bool _validateSetsData() {
    bool isValid = true;
    setControllers.forEach((exerciseIndex, sets) {
      for (var setController in sets) {
        if (setController['weight'].text.isEmpty ||
            setController['reps'].text.isEmpty) {
          isValid = false;
          break;
        }
      }
    });
    return isValid;
  }

  Future<void> _saveTemplate() async {
    if (!_validateSetsData()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Vyplňte všechny váhy a opakování!")));
      return;
    }

    // Aktualizace modelu cvičení na základě textu z řídících polí
    for (int i = 0; i < exercises.length; i++) {
      for (int j = 0; j < (setControllers[i]?.length ?? 0); j++) {
        var weightText = setControllers[i]![j]['weight'].text;
        var repsText = setControllers[i]![j]['reps'].text;
        int reps = int.tryParse(repsText) ?? 0;
        double weight = double.tryParse(weightText) ?? 0.0;
        exercises[i].sets[j] = Set(reps: reps, weight: weight);
      }
    }

    WorkoutTemplate template = WorkoutTemplate(
      nazev: _titleController.text,
      exercises: exercises,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? templatesJson = prefs.getString('workoutTemplates');
    List<dynamic> templates =
        templatesJson != null ? jsonDecode(templatesJson) : [];
    templates.add(template.toJson());
    await prefs.setString('workoutTemplates', jsonEncode(templates));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: _isEditingTitle
            ? TextField(
                controller: _titleController,
                onSubmitted: (_) => _toggleTitleEdit(),
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Zadejte název šablony',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              )
            : GestureDetector(
                onTap: _toggleTitleEdit,
                child: Text(
                  _titleController.text,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          ...exercises.asMap().entries.map((entry) {
            int exerciseIndex = entry.key;
            Exercise exercise = entry.value;
            return Card(
              color: Colors.grey[700],
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(exercise.cvik.obrazek,
                            width: 50, height: 50),
                        SizedBox(width: 10),
                        Text(
                          exercise.cvik.nazev,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteExercise(exerciseIndex),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: setControllers[exerciseIndex]?.length ?? 0,
                      itemBuilder: (context, setIndex) {
                        var controllers =
                            setControllers[exerciseIndex]![setIndex];
                        return Row(
                          children: [
                            Text('${setIndex + 1}:',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextField(
                                controller: controllers['weight'],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Váha",
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: controllers['reps'],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Opakování",
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteSet(exerciseIndex, setIndex),
                            ),
                          ],
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () => _addSet(exerciseIndex),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _addExerciseDialog(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[600],
              minimumSize: Size(350, 40),
            ),
            child: Text("Přidat cvik", style: TextStyle(color: Colors.black)),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _saveTemplate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(350, 40),
            ),
            child: Text("Uložit šablonu",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
