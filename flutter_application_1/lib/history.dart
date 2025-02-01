import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart'; // zde by měly být definovány mainBackgroundColor, midItemColor, softItemColor apod.
import 'templates.dart'; // obrazovka se šablonami
import 'database/exercises.dart'; // obrazovka cvičení

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

  /// V této metodě sestavujeme detailní zobrazení tréninku.
  /// Pro každý cvik (z workout['exercises']) se vypíše název cviku a pod ním jednotlivé série
  /// získané z workout['sets'] (kde klíč odpovídá indexu cviku).
  void _showWorkoutDetail(Map<String, dynamic> workout) {
    // Získáme seznam cviků a mapu sérií
    List<dynamic> exercises = workout['exercises'] ?? [];
    Map<String, dynamic> setsMap = workout['sets'] ?? {};

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                  // Předpokládáme, že každý cvik je uložený jako Map a má vnořený objekt 'cvik'
                  // s názvem v 'nazev'
                  Text(
                    exercises[i]['cvik'] != null && exercises[i]['cvik']['nazev'] != null
                        ? exercises[i]['cvik']['nazev']
                        : 'Cvik ${i + 1}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  // Načteme seznam sérií pro tento cvik (klíč jako string indexu)
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
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          backgroundColor: midItemColor,
        );
      },
    );
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
                    title: Text(workout['nazev']),
                    textColor: Colors.white,
                    subtitle: Text(
                      'Start: ${DateTime.parse(workout['startTime']).toLocal()}',
                    ),
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
