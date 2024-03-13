import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String buttonText = 'Name';
void onPressedFunction(BuildContext context, Function(String) updateButtonText) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String enteredText = ''; // Text entered by the user

      return AlertDialog(
        title: const Text('Enter Text'),
        content: TextField(
          onChanged: (value) {
            enteredText = value; // Update enteredText when the text field changes
          },
        ),
        
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(enteredText); // Close dialog and pass entered text
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  ).then((result) {
    // This function is called when the dialog is closed
    if (result != null && result != '') {
      updateButtonText(result); // Update buttonText with entered text
    }
  });
}

Color darkItemColor = const Color(0xFF9754CB);
Color mainBackgroundColor = const Color(0xFF28104E);
Color midItemColor = const Color(0xFF6237A0);
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
        home: const MyHomePage(title: 'Profile',));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  void _updateButtonText(String text) {
    setState(() {
      buttonText = text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: [
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Action for the first button
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder( // Button border shape
                borderRadius: BorderRadius.circular(100.0),
              ),
              minimumSize: const Size(200, 200),
              backgroundColor: midItemColor,
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.black,
              ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => onPressedFunction(context, _updateButtonText),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder( // Button border shape
                borderRadius: BorderRadius.circular(20.0),
              ),
              minimumSize: const Size(280, 50),
              backgroundColor: midItemColor
            ),
            
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              ),
          ),
          const SizedBox(height: 30),
          
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FifthScreen()), // Replace HistoryScreen() with the actual screen class for the history
              );
              // Action for the fourth button
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder( // Button border shape
                borderRadius: BorderRadius.circular(20.0),
              ),
              minimumSize: const Size(280, 150),
              backgroundColor: midItemColor
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                  'TRAININGS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30), // Add some spacing between the text and the button
                Icon(Icons.alarm, size: 40), // Example icon, you can replace it with any widget you want
              ],
            ),
          ),
        ],
      ),
      ),
      backgroundColor: mainBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: midItemColor,
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
      body: 
      
      Container(
        
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
            
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            SizedBox(
              height: 50,
              width: 150,
              
  
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
    
  Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                color: midItemColor,
                borderRadius: BorderRadius.circular(15.0), // Přidává zaoblení 15 pixelů
              ),
      child: TextButton(onPressed: (){
        showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: softItemColor,
                  title: const Text("",  style: TextStyle(fontSize: 30),),
                  content: const SizedBox(
                    height: 200.0, // Maximální výška
                    width: 100.0, // Maximální šířka
                    child: Text("", style: TextStyle(fontSize: 15,),),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close", style: TextStyle(color: Colors.black),),
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
      }, child: Text("Body part", style: TextStyle(color: Colors.white, fontSize: 12.5),)),
  ),

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
                  title: const Text("Benchpress",  style: TextStyle(fontSize: 30),),
                  content: const SizedBox(
                    height: 400.0, // Maximální výška
                    width: 300.0, // Maximální šířka
                    child: Text("Lehněte si na lavičku, chodidla pevně na zemi."
                                "Uchopte činku nadhmatem, šířka úchopu o něco větší než ramena."
                                "Nadechněte se, spouštějte činku k hrudníku (dotyk na úrovni bradavek)."
                                "Vydechněte a vytlačte činku zpět do výchozí pozice."
                                "Opakujte požadovaný počet opakování.", style: TextStyle(fontSize: 15,),),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Zavřít", style: TextStyle(color: Colors.black),),
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
