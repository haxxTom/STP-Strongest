import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/exercises.dart';
import 'main.dart';
import 'random.dart';
import 'ex1.dart';
import 'history.dart';
import 'emptyworkout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/database/database.dart';
import 'dart:convert';

class TemplateScreen extends StatefulWidget {
  TemplateScreen({Key? key}) : super(key: key);

  @override
  _TemplateScreenState createState() => _TemplateScreenState();
  
}

class _TemplateScreenState extends State<TemplateScreen> {
  // Předpokládám, že activeWorkout je nějaká proměnná, která drží aktivní trénink
  Trenink? activeWorkout;
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

  @override
  void initState() {
    super.initState();
    _loadWorkout();
  }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(midItemColor),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(150, 75))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SixthScreen()),
                    );
                  },
                  child: const Text(
                    "Nová šablona",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(midItemColor),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(150, 75))),
                  onPressed: () {
                    setState(() {
                      if (activeWorkout == null) {
                        Trenink trenink = startNewWorkout("Nový Trénink");
                        activeWorkout = trenink;
                      }
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewWorkoutScreen(trenink: activeWorkout!),
                      ),
                    );
                  },
                  child: Text(
                    activeWorkout == null ? "Nový Trénink" : "Pokračovat v tréninku",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: midItemColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Template 1",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(children: [
                            Text(
                              "Exercise x reps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Exercise x reps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: midItemColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Template 2",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(children: [
                            Text(
                              "Exercise x reps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Exercise x reps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: midItemColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Template 3",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(children: [
                            Text(
                              "Exercise x reps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Exercise x reps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: midItemColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Template 4",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(children: [
                            Text(
                              "Exercise x reps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Exercise x reps",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
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
                  builder: (context) => const ProfileScreen(title: 'profile')),
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

class SixthScreen extends StatelessWidget {
  const SixthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'New Template',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: mainBackgroundColor,
      ),
      backgroundColor: mainBackgroundColor,
      body: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                color: midItemColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Column(
                children: [
                  const Text(
                    "Exercise 1",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Type"),
                      Text("Rep"),
                      Text("Weight"),
                      Text("RPE"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Type"),
                      Text("Rep"),
                      Text("Weight"),
                      Text("RPE"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Type"),
                      Text("Rep"),
                      Text("Weight"),
                      Text("RPE"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Add"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Remove"),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    child: Text("Add exercises"),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    child: Text("Save Template"),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    child: Text("Cancel"),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: softItemColor,
        selectedItemColor: Colors.white,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfileScreen(title: 'profile')),
            );
          }
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RandomScreen()),
            );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TemplateScreen()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ExerciseScreen()),
            );
          }
          if (index == 4) {
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
            icon: const Icon(Icons.casino),
            label: 'Random',
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
            icon: const Icon(Icons.history),
            label: 'History',
          )
        ],
      ),
    );
  }
}
