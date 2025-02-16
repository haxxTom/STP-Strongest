import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/exercises.dart';
import 'main.dart';
import 'random.dart';
import 'ex1.dart';
import 'history.dart';
import 'emptyworkout.dart'; // Zde je definována třída NewEmptyWorkoutScreen
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/database/database.dart';
import 'dart:convert';
import 'emptytemplate.dart';

// Předpokládejme, že máte definovaný model WorkoutTemplate, který ukládá název a seznam cvičení.
class WorkoutTemplate {
  String nazev;
  List<dynamic> exercises; // Předpokládáme, že se zde ukládají objekty typu Exercise

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
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TemplateScreen extends StatefulWidget {
  TemplateScreen({Key? key}) : super(key: key);

  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  Trenink? activeWorkout;
  List<WorkoutTemplate> templates = [];
  bool _isLoadingTemplates = true;

  Future<List<Map<String, String>>> _loadSetsDataFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedSetsDataString = prefs.getString('setsData');

    List<Map<String, String>> loadedSetsData = [];

    if (savedSetsDataString != null) {
      List<String> sets = savedSetsDataString.split(',');

      for (var set in sets) {
        var weight = RegExp(r'"weight": "(.*?)"').firstMatch(set)?.group(1);
        var reps = RegExp(r'"reps": "(.*?)"').firstMatch(set)?.group(1);

        if (weight != null && reps != null) {
          loadedSetsData.add({'weight': weight, 'reps': reps});
        }
      }
    }

    return loadedSetsData;
  }

  Future<void> _loadWorkout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? workoutJson = prefs.getString('activeWorkout');

    if (workoutJson != null) {
      setState(() {
        activeWorkout = Trenink.fromJson(jsonDecode(workoutJson));
      });
    }
  }

  Future<void> _loadTemplates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? templatesJson = prefs.getString('workoutTemplates');
    if (templatesJson != null) {
      List<dynamic> jsonList = jsonDecode(templatesJson);
      List<WorkoutTemplate> loadedTemplates = jsonList
          .map((templateJson) =>
              WorkoutTemplate.fromJson(templateJson as Map<String, dynamic>))
          .toList();
      setState(() {
        templates = loadedTemplates;
        _isLoadingTemplates = false;
      });
    } else {
      setState(() {
        templates = [];
        _isLoadingTemplates = false;
      });
    }
  }

  Future<void> _deleteTemplate(int index) async {
    setState(() {
      templates.removeAt(index);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String updatedJson =
        jsonEncode(templates.map((t) => t.toJson()).toList());
    await prefs.setString('workoutTemplates', updatedJson);
  }

  @override
  void initState() {
    super.initState();
    _loadWorkout();
    _loadTemplates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Šablony',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: mainBackgroundColor,
      ),
      backgroundColor: mainBackgroundColor,
      body: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        child: Column(
          children: [
            // Řada tlačítek nahoře
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(midItemColor),
                    fixedSize: MaterialStateProperty.all<Size>(
                        const Size(150, 75)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TemplateWorkoutScreen()),
                    ).then((_) {
                      // Po návratu načteme znovu šablony, pokud by mohly být aktualizovány
                      _loadTemplates();
                    });
                  },
                  child: const Text(
                    "Nová šablona",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(midItemColor),
                    fixedSize: MaterialStateProperty.all<Size>(
                        const Size(150, 75)),
                  ),
                  onPressed: () {
                    setState(() {
                      // Kontrola, zda už máme aktivní trénink
                      if (activeWorkout == null) {
                        Trenink trenink = startNewWorkout("Nový Trénink");
                        activeWorkout = trenink;
                        print("Nový trénink byl vytvořen.");
                      } else {
                        print("Pokračujeme v tréninku.");
                      }
                    });
                    // Navigace na obrazovku NewEmptyWorkoutScreen s aktivním tréninkem.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewEmptyWorkoutScreen(trenink: activeWorkout!),
                      ),
                    );
                  },
                  child: Text(
                    activeWorkout == null
                        ? "Nový Trénink"
                        : "Pokračovat v tréninku",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Zobrazení uložených šablon
            Expanded(
              child: _isLoadingTemplates
                  ? const Center(child: CircularProgressIndicator())
                  : templates.isEmpty
                      ? const Center(
                          child: Text(
                            "Žádné šablony",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          itemCount: templates.length,
                          itemBuilder: (context, index) {
                            final template = templates[index];
                            // Získáme názvy prvních dvou cviků, pokud existují.
                            String subtitleText = "";
                            if (template.exercises.isNotEmpty) {
                              List<dynamic> firstTwo = template.exercises.length > 2
                                  ? template.exercises.sublist(0, 2)
                                  : template.exercises;
                              subtitleText = firstTwo
                                  .map((ex) => ex.cvik.nazev)
                                  .join(", ");
                            }
                            return Card(
                              color: midItemColor,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                title: Text(
                                  template.nazev,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  subtitleText,
                                  style:
                                      const TextStyle(color: Colors.white70),
                                ),
                                onTap: () {
                                  // Po kliknutí se zobrazí dialog s detailem tréninku.
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: midItemColor,
                                        title: Text(
                                          template.nazev,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Detail tréninku:',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(height: 10),
                                              // Projdeme jednotlivé cviky
                                              for (int i = 0; i < template.exercises.length; i++) ...[
                                                Text(
                                                  template.exercises[i].cvik.nazev,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(height: 5),
                                                Builder(
                                                  builder: (context) {
                                                    List<dynamic> series = template.exercises[i].sets;
                                                    if (series.isEmpty) {
                                                      return const Text(
                                                          'Žádné série',
                                                          style: TextStyle(
                                                              fontStyle: FontStyle.italic,
                                                              color: Colors.white70));
                                                    }
                                                    return Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        for (int j = 0; j < series.length; j++)
                                                          Text(
                                                            '${j + 1}. SERIE: ${series[j].weight} KG - ${series[j].reps}x',
                                                            style: const TextStyle(fontSize: 14, color: Colors.white),
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              // Vytvoříme nový trénink podle šablony s předdefinovanými cviky.
                                              Trenink newTraining = Trenink(
                                                nazev: template.nazev,
                                                startTime: DateTime.now(),
                                              );
                                              newTraining.exercises = List<Exercise>.from(template.exercises);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => NewEmptyWorkoutScreen(trenink: newTraining),
                                                ),
                                              );
                                            },
                                            icon: const Icon(Icons.repeat, color: Colors.white),
                                            label: const Text(
                                              "Spustit trénink",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                onLongPress: () async {
                                  bool? confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Odstranit šablonu"),
                                      content: const Text("Opravdu chcete odstranit tuto šablonu?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(false),
                                          child: const Text("Ne"),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(true),
                                          child: const Text("Ano"),
                                        ),
                                      ],
                                    ),
                                  );
                                  if (confirm == true) {
                                    _deleteTemplate(index);
                                  }
                                },
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: softItemColor,
        selectedItemColor: Colors.white,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(title: 'profile'),
              ),
            );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Exercises()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HistoryScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: mainBackgroundColor,
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: mainBackgroundColor,
            icon: const Icon(Icons.add),
            label: 'Templates',
          ),
          BottomNavigationBarItem(
            backgroundColor: mainBackgroundColor,
            icon: const Icon(Icons.fitness_center),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            backgroundColor: mainBackgroundColor,
            icon: const Icon(Icons.alarm),
            label: 'History',
          )
        ],
      ),
    );
  }
}
