import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'exercisesList.dart';
import 'database.dart';
import '../main.dart';
import '../templates.dart';
import '../random.dart';
import '../history.dart';

class ExerciseItem extends StatelessWidget {
  final Cvik cvik;

  const ExerciseItem({Key? key, required this.cvik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        width: 300,
        height: 80,
        decoration: BoxDecoration(
          color: midItemColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: softItemColor,
                        title: Text(
                          cvik.nazev,
                          style: const TextStyle(fontSize: 30),
                        ),
                        content: const SizedBox(
                          height: 400.0, // Maximální výška
                          width: 300.0, // Maximální šířka
                          child: Text(
                            "Popis",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Zavřít",
                              style: TextStyle(color: Colors.black),
                              ),
                          ),
                        ],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        elevation: 20.0,
                        contentPadding: const EdgeInsets.all(25.0),
                        insetPadding: const EdgeInsets.all(20.0),
                      );
                    },
                  );
                },
                child: Row(
                  children:[
                    Image.asset(
                      cvik.obrazek,
                      width: 100,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 215,
                          child: Column(                                        
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cvik.nazev,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                cvik.partie,
                                style: const TextStyle(
                                  color: Colors.white, fontSize: 12.5),
                                  textAlign: TextAlign.center,
                              ),
                            ],
                          ),                                   
                        )
                      ]
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Cvik> _filteredCviky = scviky;
  String _searchText = "";
  final _focusNode = FocusNode();
  bool _showSearchBar = false;
  

       
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        toolbarHeight: 130,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 17,
            ),
            const Text(
              "Exercises",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: midItemColor,
                      borderRadius: BorderRadius.circular(15.0), 
                    ),
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: midItemColor,
                              title: const Text(
                                "Search by Body Part",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.center
                              ),
                              content: const Row(
                                children: [],
                              ),
                            );
                          }
                        );
                      },
                      child: const Text(
                        "Body Part",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 50, 
                    height: 50, 
                    child: FloatingActionButton(
                      backgroundColor: midItemColor,
                      onPressed: () {
                        setState(() {
                          _showSearchBar = !_showSearchBar;
                          if (_showSearchBar) {
                            _focusNode.requestFocus();
                          } else {
                            _focusNode.unfocus();
                            _searchText = ""; // Clear search text on close
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
                 Expanded( // Ensures the TextField fills the remaining space
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        focusNode: _focusNode,
                        onChanged: (value) {
                          setState(() {
                            _searchText = value;
                            // Filter exercises based on search term
                            _filteredCviky = scviky.where((cvik) => cvik.nazev.toLowerCase().contains(_searchText.toLowerCase())).toList();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Search Exercises",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                
              ],
            ),
            )
            
          ],
        ),
      ),
      backgroundColor: mainBackgroundColor,
      body: GestureDetector(
        onTap: () {
          _focusNode.unfocus(); // Unfocus the TextField on tap outside (optional)
        },
        child: Column(
          children: [
            // Button to toggle search bar visibility
            Expanded( // Ensures the list fills the remaining space
              child: ListView.builder(
                itemCount: _filteredCviky.length, // Use filtered list for display
                itemBuilder: (context, index) {
                  final cvik = _filteredCviky[index];
                  return ExerciseItem(cvik: cvik);
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
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen(title: 'profile')),
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
          if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HistoryScreen()),
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