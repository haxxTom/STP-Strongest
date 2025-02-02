import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart'; 
import 'templates.dart'; 
import 'database/exercises.dart'; 
import 'emptyworkout.dart';
import 'database/database.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> workoutHistory = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? historyJson = prefs.getString('workoutHistory');
    if (historyJson != null) {
      List<dynamic> historyList = jsonDecode(historyJson);
      setState(() {
        workoutHistory =
            historyList.map((e) => e as Map<String, dynamic>).toList();
      });
    }
  }

  /// Zobrazí detail tréninku (stávající kód)
 void _showWorkoutDetail(Map<String, dynamic> workout) {
    // Získáme seznam cviků a mapu sérií
    List<dynamic> exercises = workout['exercises'] ?? [];
    Map<String, dynamic> setsMap = workout['sets'] ?? {};

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: midItemColor,
          title: Text(
            '${workout['nazev']}',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detail tréninku:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Projdeme jednotlivé cviky
                for (int i = 0; i < exercises.length; i++) ...[
                  Text(
                    exercises[i]['cvik'] != null && exercises[i]['cvik']['nazev'] != null
                        ? exercises[i]['cvik']['nazev']
                        : 'Cvik ${i + 1}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Builder(
                    builder: (context) {
                      List<dynamic> series = setsMap[i.toString()] ?? [];
                      if (series.isEmpty) {
                        return const Text('Žádné série',
                            style: TextStyle(fontStyle: FontStyle.italic));
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int j = 0; j < series.length; j++)
                            Text(
                              '${j + 1}. SERIE: ${series[j]['weight']} KG - ${series[j]['reps']}x',
                              style: const TextStyle(fontSize: 14),
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
            // Tlačítko pro zopakování tréninku
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context); // Zavře detailní dialog
                // Vytvoříme kopii původních dat tréninku
                Map<String, dynamic> workoutData = Map<String, dynamic>.from(workout);

                // Pokud existují data o sériích uložené v samostatném klíči 'sets',
                // sloučíme je do příslušných cvičení.
                if (workoutData.containsKey('sets')) {
                  Map<String, dynamic> setsData =
                      Map<String, dynamic>.from(workoutData['sets']);
                  List<dynamic> exercises = workoutData['exercises'];
                  for (int i = 0; i < exercises.length; i++) {
                    if (setsData.containsKey(i.toString())) {
                      exercises[i]['sets'] = setsData[i.toString()];
                    }
                  }
                  // Odstraníme samostatný klíč 'sets', protože jsme je již sloučili
                  workoutData.remove('sets');
                }

                // Aktualizujeme startTime na aktuální čas, abychom nezobrazovali starý čas.
                workoutData['startTime'] = DateTime.now().toIso8601String();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewEmptyWorkoutScreen(
                      trenink: Trenink.fromJson(workoutData),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.repeat, color: Colors.white),
              label: const Text(
                "Zopakovat trénink",
                style: TextStyle(color: Colors.white),
              ),
            ),          
          ],
        );
      },
    );
  }

  /// Zobrazí dialog s akcemi "Přejmenovat" (tužka) a "Smazat" (koš) pro daný trénink
  void _showWorkoutActions(int index) {
    Map<String, dynamic> workout = workoutHistory[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: midItemColor,
          title: Text(
            workout['nazev'],
            style: const TextStyle(color: Colors.white),
          ),
          content: const Text(
            "Vyberte akci:",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              tooltip: "Přejmenovat",
              onPressed: () async {
                Navigator.pop(context); // zavřeme akční dialog
                await _renameWorkout(index);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              tooltip: "Smazat",
              onPressed: () async {
                Navigator.pop(context); // zavřeme akční dialog
                await _deleteWorkout(index);
              },
            ),
          ],
        );
      },
    );
  }

  /// Metoda pro přejmenování workoutu
  Future<void> _renameWorkout(int index) async {
    Map<String, dynamic> workout = workoutHistory[index];
    TextEditingController renameController =
        TextEditingController(text: workout['nazev']);
    bool renameConfirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: midItemColor,
          title: const Text("Přejmenujte trénink"),
          content: TextField(
            controller: renameController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Nový název",
              labelStyle: const TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child:
                  const Text("Zrušit", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
    if (renameConfirmed == true) {
      setState(() {
        workoutHistory[index]['nazev'] = renameController.text;
      });
      // Uložíme aktualizovanou historii do SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('workoutHistory', jsonEncode(workoutHistory));
    }
  }

  /// Metoda pro smazání workoutu
  Future<void> _deleteWorkout(int index) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: midItemColor,
          title: const Text("Opravdu chcete smazat trénink?"),
          content: const Text("Tento trénink bude nenávratně smazán.",
              style: TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Ne", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Ano", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
    if (confirmDelete == true) {
      setState(() {
        workoutHistory.removeAt(index);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('workoutHistory', jsonEncode(workoutHistory));
    }
  }

  final TextStyle infoStyle = const TextStyle(
    fontSize: 12,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'History',
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
      body: workoutHistory.isEmpty
          ? const Center(
              child: Text(
                'Žádná historie tréninků',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: workoutHistory.length,
              itemBuilder: (context, index) {
                final workout = workoutHistory[index];
                return Card(
                  color: midItemColor,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      workout['nazev'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Start: ${DateTime.parse(workout['startTime']).toLocal()}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    // Při dlouhém podržení zobrazíme tlačítka pro přejmenování a smazání
                    onLongPress: () => _showWorkoutActions(index),
                    onTap: () => _showWorkoutDetail(workout),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: softItemColor,
        selectedItemColor: Colors.white,
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ProfileScreen(title: 'profile'),
              ),
            );
          }
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TemplateScreen()),
            );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Exercises()),
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
            icon: const Padding(
              padding: EdgeInsets.all(0),
              child: Icon(Icons.add),
            ),
            label: 'Templates',
          ),
          BottomNavigationBarItem(
            backgroundColor: mainBackgroundColor,
            icon: const Padding(
              padding: EdgeInsets.all(0),
              child: Icon(Icons.fitness_center),
            ),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            backgroundColor: mainBackgroundColor,
            icon: const Padding(
              padding: EdgeInsets.all(0),
              child: Icon(Icons.alarm),
            ),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
