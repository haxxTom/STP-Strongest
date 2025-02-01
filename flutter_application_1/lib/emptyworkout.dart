import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'database/exercisesList.dart';
import 'database/database.dart';
import 'templates.dart';

class NewEmptyWorkoutScreen extends StatefulWidget {
  final Trenink trenink;

  NewEmptyWorkoutScreen({required this.trenink});

  @override
  _NewEmptyWorkoutScreenState createState() => _NewEmptyWorkoutScreenState();
}

class _NewEmptyWorkoutScreenState extends State<NewEmptyWorkoutScreen> {
  Timer? _timer;
  Duration _elapsedTime = Duration();
  TextEditingController _titleController = TextEditingController();
  bool _isEditingTitle = false;

  // Klíčem je index cviku, hodnotou seznam sérií (každá série obsahuje controllery a stav)
  Map<int, List<Map<String, dynamic>>> setControllers = {};

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.trenink.nazev;
    _startTimer();
    _loadSetsData();
    _loadCompletedSets();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _elapsedTime = DateTime.now().difference(widget.trenink.startTime);
        });
      }
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
          backgroundColor: softItemColor,
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
                      int exerciseIndex = widget.trenink.exercises.length - 1;
                      _addSet(exerciseIndex);
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
      var weightController = TextEditingController();
      var repsController = TextEditingController();
      setControllers[exerciseIndex]!.add({
        'weight': weightController,
        'reps': repsController,
        'completed': false,
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
          'weight': setController['weight']!.text,
          'reps': setController['reps']!.text,
        });
      });
    });
    return allSetsData;
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

  Future<void> _saveWorkout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String workoutJson = jsonEncode(widget.trenink.toJson());
    await prefs.setString('activeWorkout', workoutJson);
  }

  Future<void> _saveSetsData() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {};
    setControllers.forEach((exerciseIndex, sets) {
      data[exerciseIndex.toString()] = sets.map((s) {
        return {
          'weight': s['weight'].text,
          'reps': s['reps'].text,
          'completed': s['completed'],
        };
      }).toList();
    });
    String allSetsDataString = jsonEncode(data);
    await prefs.setString('setsData', allSetsDataString);
  }

  Future<void> _loadSetsData() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedSetsDataString = prefs.getString('setsData');
    if (savedSetsDataString != null) {
      Map<String, dynamic> data = jsonDecode(savedSetsDataString);
      setState(() {
        setControllers.clear();
        data.forEach((exerciseIndexStr, setsList) {
          int exerciseIndex = int.parse(exerciseIndexStr);
          setControllers[exerciseIndex] = [];
          for (var setData in setsList) {
            var weightController =
                TextEditingController(text: setData['weight']);
            var repsController = TextEditingController(text: setData['reps']);
            setControllers[exerciseIndex]!.add({
              'weight': weightController,
              'reps': repsController,
              'completed': setData['completed'] ?? false,
            });
          }
        });
      });
    }
  }

  void _toggleSetCompletion(int exerciseIndex, int setIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key =
        'completedSets_${widget.trenink.startTime.millisecondsSinceEpoch}';
    List<String> completedSets = prefs.getStringList(key) ?? [];
    String setKey = '$exerciseIndex-$setIndex';
    if (completedSets.contains(setKey)) {
      completedSets.remove(setKey);
    } else {
      completedSets.add(setKey);
    }
    await prefs.setStringList(key, completedSets);
    setState(() {
      setControllers[exerciseIndex]![setIndex]['completed'] =
          completedSets.contains(setKey);
    });
  }

  Future<void> _loadCompletedSets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key =
        'completedSets_${widget.trenink.startTime.millisecondsSinceEpoch}';
    List<String> completedSets = prefs.getStringList(key) ?? [];
    setState(() {
      setControllers.forEach((exerciseIndex, sets) {
        for (int i = 0; i < sets.length; i++) {
          String setKey = '$exerciseIndex-$i';
          sets[i]['completed'] = completedSets.contains(setKey);
        }
      });
    });
  }

  Future<void> _finishWorkout() async {
    if (!_validateSetsData()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Vyplňte všechny váhy a opakování!")),
      );
      return;
    }

    // Nejprve se zeptáme, jak pojmenovat trénink
    // Předvyplněný text obsahuje dosavadní název a datum a čas začátku tréninku.
    String defaultName =
        "${widget.trenink.nazev} - ${widget.trenink.startTime.toLocal().toString()}";
    TextEditingController nameController =
        TextEditingController(text: defaultName);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pojmenujte trénink"),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Název tréninku"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Zrušit"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    // Aktualizujeme název tréninku podle vstupu uživatele.
    widget.trenink.nazev = nameController.text;

    // Nastavíme konečný čas tréninku.
    widget.trenink.endTime = DateTime.now();

    // Vytvoříme objekt se všemi daty tréninku včetně sérií.
    Map<String, dynamic> finishedWorkout = widget.trenink.toJson();
    finishedWorkout['sets'] = {};
    setControllers.forEach((exerciseIndex, sets) {
      finishedWorkout['sets'][exerciseIndex.toString()] = sets.map((s) {
        return {
          'weight': s['weight'].text,
          'reps': s['reps'].text,
          'completed': s['completed'],
        };
      }).toList();
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? historyJson = prefs.getString('workoutHistory');
    List<dynamic> history = historyJson != null ? jsonDecode(historyJson) : [];
    history.add(finishedWorkout);
    await prefs.setString('workoutHistory', jsonEncode(history));

    // Vymažeme data aktuálního tréninku, aby nový trénink začínal od nuly.
    await prefs.remove('activeWorkout');
    await prefs.remove('setsData');
    await prefs.remove(
      'completedSets_${widget.trenink.startTime.millisecondsSinceEpoch}',
    );

    if (mounted) {
      setState(() {
        widget.trenink.exercises.clear();
      });
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TemplateScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _saveSetsData();
        await _saveWorkout();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
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
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
              Text(
                '${_elapsedTime.inMinutes}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            ...widget.trenink.exercises.asMap().entries.map((entry) {
              int exerciseIndex = entry.key;
              var exercise = entry.value;
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                            var controllers =
                                setControllers[exerciseIndex]![setIndex];
                            bool completed = controllers['completed'] ?? false;
                            return Row(
                              children: [
                                Text(
                                  'Série ${setIndex + 1}:',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: controllers['weight'],
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: const InputDecoration(
                                        labelText: "Váha"),
                                    enabled: !completed,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: controllers['reps'],
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: const InputDecoration(
                                        labelText: "Počet opakování"),
                                    enabled: !completed,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    completed ? Icons.lock : Icons.lock_open,
                                    color:
                                        completed ? Colors.green : Colors.grey,
                                  ),
                                  tooltip: completed
                                      ? "Série zamčena"
                                      : "Uzamknout sérii",
                                  onPressed: () => _toggleSetCompletion(
                                      exerciseIndex, setIndex),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    _deleteSet(exerciseIndex, setIndex);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            _addSet(exerciseIndex);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                _addExerciseDialog(context);
              },
            ),
            Column(
              children: [
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: _finishWorkout,
                    style: ElevatedButton.styleFrom(minimumSize: Size(100, 50)),
                    child: const Text(
                      "Dokončit trénink",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
