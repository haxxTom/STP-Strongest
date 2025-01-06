import 'package:flutter/material.dart';
import 'dart:async'; // For Timer
import 'package:flutter/services.dart'; // For FilteringTextInputFormatter
import 'database/exercisesList.dart';
import 'database/database.dart';
import 'templates.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NewWorkoutScreen extends StatefulWidget {
  final Trenink trenink;

  NewWorkoutScreen({required this.trenink});

  @override
  _NewWorkoutScreenState createState() => _NewWorkoutScreenState();
}

class _NewWorkoutScreenState extends State<NewWorkoutScreen> {
  Timer? _timer;
  Duration _elapsedTime = Duration();
  TextEditingController _titleController = TextEditingController();
  bool _isEditingTitle = false;

  // This map stores a list of text controllers for weight and reps for each exercise set
  Map<int, List<Map<String, TextEditingController>>> setControllers = {};
  
  @override
  void initState() {
    super.initState();
    _titleController.text = widget.trenink.nazev;
    _startTimer(); // Start the timer to track workout duration
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime = DateTime.now().difference(widget.trenink.startTime);
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _toggleTitleEdit() {
    setState(() {
      _isEditingTitle = !_isEditingTitle;
    });
  }

  void _addExerciseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Vyberte cvik"),
          content: SizedBox(
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: cviky.length,
              itemBuilder: (context, index) {
                final cvik = cviky[index];
                return ListTile(
                  leading: Image.asset(cvik.obrazek),
                  title: Text(cvik.nazev),
                  subtitle: Text(cvik.partie),
                  onTap: () {
                    setState(() {
                      addExerciseFromList(widget.trenink, cvik.id);
                      // After adding the exercise, immediately add a set
                      int exerciseIndex = widget.trenink.exercises.length - 1; // New exercise index
                      _addSet(exerciseIndex);  // Adds 1 set for this exercise
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _addSet(int exerciseIndex) {
    setState(() {
      if (!setControllers.containsKey(exerciseIndex)) {
        setControllers[exerciseIndex] = [];
      }

      // Create controllers for the new set (weight and reps)
      var weightController = TextEditingController();
      var repsController = TextEditingController();

      // Save the controllers in the map
      setControllers[exerciseIndex]!.add({
        'weight': weightController,
        'reps': repsController,
      });
    });
  }

  void _deleteSet(int exerciseIndex, int setIndex) {
    setState(() {
      setControllers[exerciseIndex]!.removeAt(setIndex);
    });
  }

  void _deleteExercise(int exerciseIndex) {
    setState(() {
      widget.trenink.exercises.removeAt(exerciseIndex);
      setControllers.remove(exerciseIndex);
    });
  }

  List<Map<String, String>> _getSetsData() {
    List<Map<String, String>> allSetsData = [];
    setControllers.forEach((exerciseIndex, sets) {
      sets.forEach((setController) {
        allSetsData.add({
          'weight': setController['weight']!.text,  // Use 'text' to get value
          'reps': setController['reps']!.text,      // Use 'text' to get value
        });
      });
    });
    return allSetsData;
  }

  bool _validateSetsData() {
    bool isValid = true;
    setControllers.forEach((exerciseIndex, sets) {
      for (var setController in sets) {
        // Check if weight or reps is null or empty
        final weightText = setController['weight']?.text ?? '';
        final repsText = setController['reps']?.text ?? '';
        
        if (weightText.isEmpty || repsText.isEmpty) {
          isValid = false;
          break; // Stop checking if any value is invalid
        }
      }
    });
    return isValid;
  }

    Future<void> _saveWorkout() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String workoutJson = jsonEncode(widget.trenink.toJson());
      await prefs.setString('activeWorkout', workoutJson);
    }


  Future<void> _saveSetsData() async {
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> allSetsData = _getSetsData();
    
    // Save data as a JSON string (or you can use a different format)
    String allSetsDataString = allSetsData
        .map((setData) => '{"weight": "${setData['weight']}", "reps": "${setData['reps']}"}')
        .join(',');
    
    await prefs.setString('setsData', allSetsDataString);
    print('Data byla uložena.');
  }

  Future<void> _loadSetsData() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedSetsDataString = prefs.getString('setsData');

    if (savedSetsDataString != null) {
      List<Map<String, String>> loadedSetsData = [];
      List<String> sets = savedSetsDataString.split(',');

      for (var set in sets) {
        // Parse each set from the JSON string
        var weight = RegExp(r'"weight": "(.*?)"').firstMatch(set)?.group(1);
        var reps = RegExp(r'"reps": "(.*?)"').firstMatch(set)?.group(1);
        if (weight != null && reps != null) {
          loadedSetsData.add({'weight': weight, 'reps': reps});
        }
      }

      // Load into setControllers to restore the UI
      setState(() {
        setControllers.clear();
        int index = 0;
        for (var setData in loadedSetsData) {
          _addSet(index); // Add the set to the correct exercise
          var lastSet = setControllers[index]?.last;
          if (lastSet != null) {
            lastSet['weight']?.text = setData['weight']!;
            lastSet['reps']?.text = setData['reps']!;
          }
          index++;
        }
      });
      print('Data byla načtena.');
    }
  }

  void _finishWorkout() {
    if (!_validateSetsData()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Vyplňte všechny váhy a opakování!")),
      );
      return;
    }

    List<Map<String, String>> allSetsData = _getSetsData();
    print('Uloženo ${allSetsData.length} sérií do databáze nebo souboru.');

    setState(() {
      widget.trenink.exercises.clear();
      activeWorkout = null;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TemplateScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _saveWorkout();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              _isEditingTitle
                  ? Expanded(
                      child: TextField(
                        controller: _titleController,
                        onSubmitted: (_) {
                          setState(() {
                            widget.trenink.nazev = _titleController.text;
                            _toggleTitleEdit();
                          });
                        },
                        autofocus: true,
                      ),
                    )
                  : Expanded(
                      child: GestureDetector(
                        onTap: _toggleTitleEdit,
                        child: Text(
                          widget.trenink.nazev,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              Text(
                '${_elapsedTime.inMinutes}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            ...widget.trenink.exercises.map((exercise) {
              int exerciseIndex = widget.trenink.exercises.indexOf(exercise);
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              exercise.cvik.obrazek,
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              exercise.cvik.nazev,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _deleteExercise(exerciseIndex);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: setControllers[exerciseIndex]?.length ?? 0,
                          itemBuilder: (context, setIndex) {
                            var controllers = setControllers[exerciseIndex]![setIndex];
                            return Row(
                              children: [
                                Text(
                                  'Série ${setIndex + 1}:',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    controller: controllers['weight'],
                                    decoration: const InputDecoration(
                                      labelText: 'Váha (kg)',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onChanged: (value) {
                                      setControllers[exerciseIndex]![setIndex]['weight']?.text = value;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    controller: controllers['reps'],
                                    decoration: const InputDecoration(
                                      labelText: 'Opakování',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onChanged: (value) {
                                      setControllers[exerciseIndex]![setIndex]['reps']?.text = value;
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    _deleteSet(exerciseIndex, setIndex);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _addSet(exerciseIndex);
                          },
                          child: const Text("Přidat novou sérii"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
            ListTile(
              title: const Text("Přidat cvik"),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  _addExerciseDialog(context);
                },
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () {
                  _finishWorkout();
                },
                child: const Text("Dokončit Trénink"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
