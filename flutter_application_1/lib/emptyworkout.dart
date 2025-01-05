import 'package:flutter/material.dart';
import 'dart:async'; // Pro Timer
import 'package:flutter/services.dart'; // Pro FilteringTextInputFormatter
import 'database/exercisesList.dart';
import 'database/database.dart';
import 'database/treninky.dart';
import 'templates.dart';

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

  // Tato mapa uchovává seznam textových polí pro váhu a opakování pro každý cvik
  Map<int, List<Map<String, TextEditingController>>> setControllers = {};

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.trenink.nazev;

    // Spuštění timeru pro sledování času tréninku
    _startTimer();
  }
  
  // Funkce pro startování časovače
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime = DateTime.now().difference(widget.trenink.startTime);
      });
    });
  }

  // Funkce pro zastavení timeru
  void _stopTimer() {
    _timer?.cancel();
  }

  // Funkce pro přepnutí na editaci názvu
  void _toggleTitleEdit() {
    setState(() {
      _isEditingTitle = !_isEditingTitle;
    });
  }

  // Dialog pro přidání cviku
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
                      // Přidání cviku do tréninku
                      addExerciseFromList(widget.trenink, cvik.id);
                    });
                    Navigator.pop(context); // Zavření dialogu
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  // Funkce pro přidání nové série
  void _addSet(int exerciseIndex) {
    setState(() {
      if (!setControllers.containsKey(exerciseIndex)) {
        setControllers[exerciseIndex] = [];
      }
      setControllers[exerciseIndex]!.add({
        'reps': TextEditingController(),
        'weight': TextEditingController(),
      });
    });
  }

  // Funkce pro smazání série
  void _deleteSet(int exerciseIndex, int setIndex) {
    setState(() {
      setControllers[exerciseIndex]!.removeAt(setIndex);
    });
  }

  // Funkce pro smazání cviku
  void _deleteExercise(int exerciseIndex) {
    setState(() {
      widget.trenink.exercises.removeAt(exerciseIndex); // Odstraní cvik
      setControllers.remove(exerciseIndex); // Odstraní sériové editory pro tento cvik
    });
  }

  // Funkce pro získání váhy a opakování pro všechny série
  List<Map<String, String>> _getSetsData() {
    List<Map<String, String>> allSetsData = [];
    // Projdeme všechny cviky a sérií
    widget.trenink.exercises.forEach((exercise) {
      int exerciseIndex = widget.trenink.exercises.indexOf(exercise);
      if (setControllers.containsKey(exerciseIndex)) {
        // Projdeme všechny série pro tento cvik
        setControllers[exerciseIndex]?.forEach((setController) {
          // Každá série bude obsahovat váhu a opakování
          allSetsData.add({
            'weight': setController['weight']?.text ?? '',
            'reps': setController['reps']?.text ?? '',
          });
        });
      }
    });

    return allSetsData;
  }

  // Funkce pro dokončení tréninku
  void _finishWorkout() {
  // Získání sérií pro uložení
  List<Map<String, String>> allSetsData = _getSetsData();
  
  // Představte si, že zde chcete uložit data do nějaké databáze nebo souboru
  print('Uloženo ${allSetsData.length} sérií do databáze nebo souboru.');

  // Resetování tréninku
  setState(() {
    widget.trenink.exercises.clear();  // Vyčistit cviky
    activeWorkout = null; // Resetovat aktivní trénink
  });

  // Navigace zpět na hlavní obrazovku nebo na obrazovku, kde je seznam tréninků
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => TemplateScreen()), // Změňte MainWorkoutScreen na odpovídající obrazovku pro seznam tréninků
  );
}
  // Funkce pro uložení tréninku
  void _SaveWorkout() {
    activeWorkout = null;
    // Představte si, že zde chcete uložit data do nějaké databáze nebo souboru
    List<Map<String, String>> allSetsData = _getSetsData();
    
    // Uložení dat nebo jakýkoliv jiný mechanismus pro trénink
    print('Uloženo ${allSetsData.length} sérií do databáze nebo souboru.');

    // Ukončení tréninku
    setState(() {
      // Resetování treninku, aby se po dokončení tréninku už nenacházel aktivní trénink
      widget.trenink.exercises.clear(); 
      // Resetování activeWorkout na null
    });

    // Zavření obrazovky
    Navigator.pop(context);
  }

  // Zavolání funkce _SaveWorkout při stisknutí šipky zpět
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _SaveWorkout(); // Zavolá funkci pro uložení tréninku
        return true; // Vrátí true pro povolení návratu na předchozí obrazovku
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              // Kontrola, zda je titul v režimu úpravy
              _isEditingTitle
                  ? Expanded(
                      child: TextField(
                        controller: _titleController,
                        onSubmitted: (_) {
                          setState(() {
                            widget.trenink.nazev = _titleController.text;
                            _toggleTitleEdit(); // Ukončí režim úpravy
                          });
                        },
                        autofocus: true,
                      ),
                    )
                  : Expanded(
                      child: GestureDetector(
                        onTap: _toggleTitleEdit, // Změna názvu tréninku
                        child: Text(
                          widget.trenink.nazev,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              // Zobrazení časovače
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
            // Zobrazení cviků přidaných do tréninku
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
                        // Název a obrázek cviku
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
                            // Tlačítko pro smazání cviku
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _deleteExercise(exerciseIndex); // Smaže cvik
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Dynamické pole pro sérii
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: setControllers[exerciseIndex]?.length ?? 0,
                          itemBuilder: (context, setIndex) {
                            var controllers = setControllers[exerciseIndex]![setIndex];
                            return Row(
                              children: [
                                Text(
                                  'Série ${setIndex + 1}:', // Automatické zvyšování čísla série
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 10),
                                // Políčka pro váhu a opakování
                                Expanded(
                                  child: TextField(
                                    controller: controllers['weight'],
                                    decoration: const InputDecoration(
                                      labelText: 'Váha (kg)',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly, // Umožňuje pouze čísla
                                    ],
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
                                      FilteringTextInputFormatter.digitsOnly, // Umožňuje pouze čísla
                                    ],
                                  ),
                                ),
                                // Tlačítko pro smazání série
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    _deleteSet(exerciseIndex, setIndex); // Smaže sérii
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        // Tlačítko pro přidání nové série
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
            // Tlačítko pro přidání cviku
            ListTile(
              title: const Text("Přidat cvik"),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  _addExerciseDialog(context); // Otevře dialog pro výběr cviku
                },
                color: Colors.blue, // Barva ikony pro přidání cviku
              ),
            ),
            // Tlačítko pro dokončení tréninku
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Barva pozadí tlačítka pro dokončení tréninku
                  foregroundColor: Colors.white, // Barva textu
                  fixedSize: const Size(200, 50), // Velikost tlačítka
                ),
                onPressed: () {
                  _finishWorkout(); // Uložení tréninku
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
