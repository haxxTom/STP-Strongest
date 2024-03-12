import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Color darkItemColor = const Color(0xFF28104E);
Color mainBackgroundColor = const Color(0xFF6237A0);
Color midItemColor = const Color(0xFF9754CB);
Color softItemColor = const Color(0xFFDEACF5);

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
          scaffoldBackgroundColor: Colors.black,
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Profile'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: Text(widget.title),
      ),
      backgroundColor: mainBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: softItemColor,
        selectedItemColor: Colors.white,
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            // Check if the tapped index is 0 (home page)
            Navigator.popUntil(context, ModalRoute.withName('/'));
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FifthScreen()),
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

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: const Text(
          'Random Generator',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      backgroundColor: mainBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is the random screen.',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: darkItemColor,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Custom Dialog'),
                      content: const Text('halooo'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Custom Button'),
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
            // Check if the tapped index is 0 (home page)
            Navigator.popUntil(context, ModalRoute.withName('/'));
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FifthScreen()),
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

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void plustemplate() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SixthScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Templates',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: mainBackgroundColor,
      ),
      backgroundColor: mainBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: plustemplate,
        tooltip: 'Plus template',
        backgroundColor: darkItemColor,
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
                
              ),
              onPressed: null,
              child: Text('New'),
            ),
            MaterialButton(
              height: 100,
              minWidth: 100,
              splashColor: Colors.black,
              onPressed: null,
              child: Text('Random'),
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
            // Check if the tapped index is 0 (home page)
            Navigator.popUntil(context, ModalRoute.withName('/'));
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FifthScreen()),
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

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercises',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: mainBackgroundColor,
      ),
      
      
      body: Stack(
  children: <Widget>[
    // Pozadí
    Container(
      color: mainBackgroundColor, // Použijte proměnnou s názvem "mainBackgroundColor"
    ),
    // Umístění tlačítek nahoru
    Positioned(
      top: 50, // Odsazení shora
      left: 20, // Odsazení zleva
      child: Column(
        children: <Widget>[

          Container(
              width: 350,
              height: 80,
              decoration: BoxDecoration(
                color: midItemColor,
                borderRadius: BorderRadius.circular(25.0), // Přidává zaoblení 15 pixelů
              ),
              child: TextButton(
                onPressed: () {
                  showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: softItemColor,
                  title: Text("Benchpress",  style: TextStyle(fontSize: 30),),
                  content: SizedBox(
                    height: 400.0, // Maximální výška
                    width: 300.0, // Maximální šířka
                    child: Text("Popis cviku", style: TextStyle(fontSize: 15,),),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Zavřít", style: TextStyle(color: Colors.black),),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  elevation: 20.0,
                  contentPadding: EdgeInsets.all(25.0),
                  insetPadding: EdgeInsets.all(20.0),
                );
              },
            );

                },
                child: Row( // Uspořádání do řádku pro horizontální uspořádání
                  children: <Widget>[
                    Image.asset(
                      'assets/Images/bench.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(width: 10), // Mezera mezi obrázkem a textem
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 50.0), // Přidá odsazení 10px zprava
                        child: Text(
                          "Benchpress",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.center, // Zarovnání textu vpravo
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),

          SizedBox(height: 20), // Mezera mezi tlačítky
          Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(
              color: midItemColor,
              borderRadius: BorderRadius.circular(25.0), // Přidává zaoblení 15 pixelů
            ),
            child: TextButton(
              onPressed: () {
                showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: softItemColor,
                title: Text("Benchpress",  style: TextStyle(fontSize: 30),),
                content: SizedBox(
                  height: 400.0, // Maximální výška
                  width: 300.0, // Maximální šířka
                  child: Text("Popis cviku", style: TextStyle(fontSize: 15,),),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Zavřít", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                clipBehavior: Clip.antiAlias,
                elevation: 20.0,
                contentPadding: EdgeInsets.all(25.0),
                insetPadding: EdgeInsets.all(20.0),
              );
            },
          );

              },
              child: Row( // Uspořádání do řádku pro horizontální uspořádání
      children: <Widget>[
        Image.asset(
          'assets/Images/squat.png',
          width: 100,
          height: 100,
        ),
        SizedBox(width: 10), // Mezera mezi obrázkem a textem
        Expanded(
          child: Container(
            child: Text(
              "Squat",
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center, // Zarovnání textu vpravo
            ),
          ),
        ),
      ],
    ),
            ),
          ),

            SizedBox(height: 20), // Mezera mezi tlačítky
          Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(
              color: midItemColor,
              borderRadius: BorderRadius.circular(25.0), // Přidává zaoblení 15 pixelů
            ),
            child: TextButton(
              onPressed: () {
                showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: softItemColor,
                title: Text("Benchpress",  style: TextStyle(fontSize: 30),),
                content: SizedBox(
                  height: 400.0, // Maximální výška
                  width: 300.0, // Maximální šířka
                  child: Text("Popis cviku", style: TextStyle(fontSize: 15,),),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Zavřít", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                clipBehavior: Clip.antiAlias,
                elevation: 20.0,
                contentPadding: EdgeInsets.all(25.0),
                insetPadding: EdgeInsets.all(20.0),
              );
            },
          );

              },
              child: Row( // Uspořádání do řádku pro horizontální uspořádání
      children: <Widget>[
        Image.asset(
          'assets/Images/squat.png',
          width: 100,
          height: 100,
        ),
        SizedBox(width: 10), // Mezera mezi obrázkem a textem
        Expanded(
          child: Container(
            child: Text(
              "Squat",
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center, // Zarovnání textu vpravo
            ),
          ),
        ),
      ],
    ),
            ),
          ),

          SizedBox(height: 20), // Mezera mezi tlačítky
          Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(
              color: midItemColor,
              borderRadius: BorderRadius.circular(25.0), // Přidává zaoblení 15 pixelů
            ),
            child: TextButton(
              onPressed: () {
                showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: softItemColor,
                title: Text("Benchpress",  style: TextStyle(fontSize: 30),),
                content: SizedBox(
                  height: 400.0, // Maximální výška
                  width: 300.0, // Maximální šířka
                  child: Text("Popis cviku", style: TextStyle(fontSize: 15,),),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Zavřít", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                clipBehavior: Clip.antiAlias,
                elevation: 20.0,
                contentPadding: EdgeInsets.all(25.0),
                insetPadding: EdgeInsets.all(20.0),
              );
            },
          );

              },
              child: Row( // Uspořádání do řádku pro horizontální uspořádání
      children: <Widget>[
        Image.asset(
          'assets/Images/squat.png',
          width: 100,
          height: 100,
        ),
        SizedBox(width: 10), // Mezera mezi obrázkem a textem
        Expanded(
          child: Container(
            child: Text(
              "Squat",
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center, // Zarovnání textu vpravo
            ),
          ),
        ),
      ],
    ),
            ),
          ),

          SizedBox(height: 20), // Mezera mezi tlačítky
          Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(
              color: midItemColor,
              borderRadius: BorderRadius.circular(25.0), // Přidává zaoblení 15 pixelů
            ),
            child: TextButton(
              onPressed: () {
                showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: softItemColor,
                title: Text("Benchpress",  style: TextStyle(fontSize: 30),),
                content: SizedBox(
                  height: 400.0, // Maximální výška
                  width: 300.0, // Maximální šířka
                  child: Text("Popis cviku", style: TextStyle(fontSize: 15,),),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Zavřít", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                clipBehavior: Clip.antiAlias,
                elevation: 20.0,
                contentPadding: EdgeInsets.all(25.0),
                insetPadding: EdgeInsets.all(20.0),
              );
            },
          );

              },
              child: Row( // Uspořádání do řádku pro horizontální uspořádání
      children: <Widget>[
        Image.asset(
          'assets/Images/squat.png',
          width: 100,
          height: 100,
        ),
        SizedBox(width: 10), // Mezera mezi obrázkem a textem
        Expanded(
          child: Container(
            child: Text(
              "Squat",
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center, // Zarovnání textu vpravo
            ),
          ),
        ),
      ],
    ),
            ),
          ),

          SizedBox(height: 20), // Mezera mezi tlačítky
          Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(
              color: midItemColor,
              borderRadius: BorderRadius.circular(25.0), // Přidává zaoblení 15 pixelů
            ),
            child: TextButton(
              onPressed: () {
                showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: softItemColor,
                title: Text("Benchpress",  style: TextStyle(fontSize: 30),),
                content: SizedBox(
                  height: 400.0, // Maximální výška
                  width: 300.0, // Maximální šířka
                  child: Text("Popis cviku", style: TextStyle(fontSize: 15,),),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Zavřít", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                clipBehavior: Clip.antiAlias,
                elevation: 20.0,
                contentPadding: EdgeInsets.all(25.0),
                insetPadding: EdgeInsets.all(20.0),
              );
            },
          );

              },
              child: Row( // Uspořádání do řádku pro horizontální uspořádání
      children: <Widget>[
        Image.asset(
          'assets/Images/squat.png',
          width: 100,
          height: 100,
        ),
        SizedBox(width: 10), // Mezera mezi obrázkem a textem
        Expanded(
          child: Container(
            child: Text(
              "Squat",
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center, // Zarovnání textu vpravo
            ),
          ),
        ),
      ],
    ),
            ),
          ),

          

        ],
      ),
    ),
  ],
),






      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: softItemColor,
        selectedItemColor: Colors.white,
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            // Check if the tapped index is 0 (home page)
            Navigator.popUntil(context, ModalRoute.withName('/'));
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FifthScreen()),
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

class FifthScreen extends StatelessWidget {
  const FifthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: mainBackgroundColor,
      ),
      backgroundColor: mainBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Custom Dialog'),
                      content: const Text('halooo'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Custom Button'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: softItemColor,
        selectedItemColor: Colors.white,
        currentIndex: 4,
        onTap: (index) {
          if (index == 0) {
            // Check if the tapped index is 0 (home page)
            Navigator.popUntil(context, ModalRoute.withName('/'));
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FifthScreen()),
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
        title: const Text('Second Screen'),
        backgroundColor: mainBackgroundColor,
      ),
      backgroundColor: mainBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Custom Dialog'),
                      content: const Text('halooo'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Custom Button'),
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
            // Check if the tapped index is 0 (home page)
            Navigator.popUntil(context, ModalRoute.withName('/'));
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FifthScreen()),
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
