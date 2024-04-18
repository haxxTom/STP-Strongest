import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/exercises.dart';
import 'main.dart';
import 'random.dart';
import 'ex1.dart';
import 'history.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Templates',
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
                    "New",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(midItemColor),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(150, 75))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RandomScreen()),
                    );
                  },
                  child: const Text(
                    "Random",
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
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
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
              child: Column(
                children: [
                  Text(
                    "Exercise 1",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
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
                      Text("Type"),
                      Text("Rep"),
                      Text("Weight"),
                      Text("RPE"),
                    ],
                  ),
                  Row(
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
                        child: Text("Add"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Remove"),
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
              MaterialPageRoute(builder: (context) => const TemplateScreen()),
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
            icon: const Icon(Icons.alarm),
            label: 'History',
          )
        ],
      ),
    );
  }
}
