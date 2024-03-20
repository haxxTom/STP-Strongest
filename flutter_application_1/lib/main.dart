import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

String buttonText = 'Name';
String? imageFilePath;

void onPressedFunction(
    BuildContext context, Function(String) updateButtonText) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String enteredText = ''; // Text entered by the user

      return AlertDialog(
        title: const Text(
          'Set Username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
           textAlign: TextAlign.center
          ),
          
        backgroundColor: darkItemColor,
        content: TextField(
          cursorColor: Colors.white,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          maxLength: 9,
          decoration: const  InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white), // Change the color here
                  ),
            counterStyle: TextStyle(color: Colors.white),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0), // Change the color here for focused state
              ),
          ),
          onChanged: (value) {
            enteredText =
                value; // Update enteredText when the text field changes
          },
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                  .pop(enteredText); // Close dialog and pass entered text
                },
                child: const Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.white,
                  ),
                ),
            ]
          )
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
  const MyApp({ Key? key }) : super(key: key);

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
        home: const MyHomePage(
          title: 'profile',
        ));
  }
}

class MyHomePage extends StatefulWidget {
 const MyHomePage({Key? key, required this.title}) : super(key: key);

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
        title: const Center(
        child: Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 200, 
              child: ElevatedButton(
                onPressed: () async {
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      imageFilePath = pickedFile.path;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(0),
                  backgroundColor: midItemColor,
                ),
                child: Stack(
                  children: [
                    if (imageFilePath != null)
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(File(imageFilePath!)),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    if (imageFilePath == null)
                      Icon(
                        Icons.person,
                        size: 50,
                        color: softItemColor,
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => onPressedFunction(context, _updateButtonText),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  maximumSize: const Size(280, 50),
                  minimumSize: const Size(280, 50),
                  backgroundColor: midItemColor),
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const FifthScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  maximumSize: const Size(280, 150),
                  backgroundColor: midItemColor,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TRAININGS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height:30,
                    ),                 
                  Row(
                    children: [
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.pushReplacement(
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
        title: const Center(
        child: Text(
          'Random Generator',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            
          ),
        ),
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
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'profile')),
          );
          }
          if (index == 1) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.pushReplacement(
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: midItemColor,
                          title: const Text(
                            "Random training",
                            style: TextStyle(fontSize: 30),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Close",
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
                  child: const Text(
                    "Random",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
              Column(
                children: [
                  const SizedBox(height: 25,),
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
                            SizedBox(height: 15,),
                            Text(
                              "Template 1",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Column(
                              children: [
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
                              ]
                            ),
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
                            SizedBox(height: 15,),
                            Text(
                              "Template 2",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Column(
                              children: [
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
                              ]
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
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
                            SizedBox(height: 15,),
                            Text(
                              "Template 3",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Column(
                              children: [
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
                              ]
                            ),
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
                            SizedBox(height: 15,),
                            Text(
                              "Template 4",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Column(
                              children: [
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
                              ]
                            ),
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
            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'profile')),
          );
          }
          if (index == 1) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.pushReplacement(
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
        title: const Center(
        child: Text(
          'Exercises',
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
      body: Container(
        color: mainBackgroundColor,
        child: ListView(
          children: <Widget>[
            // Umístění tlačítek nahoru

            SizedBox(
              width: 100,
              child: Container(
                child: Container(
                  height: 35,
                  width: 100,
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 21.5, right: 275),
                  decoration: BoxDecoration(
                    color: midItemColor,
                    borderRadius: BorderRadius.circular(
                        12.5), // Přidává zaoblení 15 pixelů
                  ),
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  softItemColor, // Check if this affects button color
                              title: const Text("Choose body part",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30)),
                              // Removed SizedBox

                              content: TextButton(
                                onPressed: null, // This button has no action

                                style: ButtonStyle(
                                  // Set width and height
                                  backgroundColor: MaterialStateProperty.all(
                                      midItemColor), // Set background color
                                ),
                                child: const Text(
                                  "Chest",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),

                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Close",
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              elevation: 20.0,
                              contentPadding: const EdgeInsets.all(
                                  25.0), // Check if padding affects button
                              insetPadding: const EdgeInsets.all(20.0),
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Body part",
                        style: TextStyle(color: Colors.white, fontSize: 12.5),
                      )),
                ),
              ),
            ),

            Container(
              color: mainBackgroundColor,
              child: Positioned(
                top: 100, // Odsazení shora
                left: 20, // Odsazení zleva
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: midItemColor,
                        borderRadius: BorderRadius.circular(
                            25.0), // Přidává zaoblení 15 pixelů
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: softItemColor,
                                title: const Text(
                                  "Benchpress",
                                  style: TextStyle(fontSize: 30),
                                ),
                                content: const SizedBox(
                                  height: 400.0, // Maximální výška
                                  width: 300.0, // Maximální šířka
                                  child: Text(
                                    "Lehněte si na lavičku, chodidla pevně na zemi."
                                    "Uchopte činku nadhmatem, šířka úchopu o něco větší než ramena."
                                    "Nadechněte se, spouštějte činku k hrudníku (dotyk na úrovni bradavek)."
                                    "Vydechněte a vytlačte činku zpět do výchozí pozice."
                                    "Opakujte požadovaný počet opakování.",
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
                          // Uspořádání do řádku pro horizontální uspořádání
                          children: <Widget>[
                            Image.asset(
                              'assets/Images/bench.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                                width: 10), // Mezera mezi obrázkem a textem
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: 50.0), // Přidá odsazení 10px zprava
                                child: const Text(
                                  "Benchpress",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign.center, // Zarovnání textu vpravo
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Mezera mezi tlačítky
                    Container(
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: midItemColor,
                        borderRadius: BorderRadius.circular(
                            25.0), // Přidává zaoblení 15 pixelů
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: softItemColor,
                                title: const Text(
                                  "Benchpress",
                                  style: TextStyle(fontSize: 30),
                                ),
                                content: const SizedBox(
                                  height: 400.0, // Maximální výška
                                  width: 300.0, // Maximální šířka
                                  child: Text(
                                    "Popis cviku",
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
                          // Uspořádání do řádku pro horizontální uspořádání
                          children: <Widget>[
                            Image.asset(
                              'assets/Images/squat.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                                width: 10), // Mezera mezi obrázkem a textem
                            Expanded(
                              child: Container(
                                child: const Text(
                                  "Squat",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign
                                      .center, // Zarovnání textu vpravo
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Mezera mezi tlačítky
                    Container(
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: midItemColor,
                        borderRadius: BorderRadius.circular(
                            25.0), // Přidává zaoblení 15 pixelů
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: softItemColor,
                                title: const Text(
                                  "Benchpress",
                                  style: TextStyle(fontSize: 30),
                                ),
                                content: const SizedBox(
                                  height: 400.0, // Maximální výška
                                  width: 300.0, // Maximální šířka
                                  child: Text(
                                    "Popis cviku",
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
                          // Uspořádání do řádku pro horizontální uspořádání
                          children: <Widget>[
                            Image.asset(
                              'assets/Images/squat.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                                width: 10), // Mezera mezi obrázkem a textem
                            Expanded(
                              child: Container(
                                child: const Text(
                                  "Squat",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign
                                      .center, // Zarovnání textu vpravo
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Mezera mezi tlačítky
                    Container(
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: midItemColor,
                        borderRadius: BorderRadius.circular(
                            25.0), // Přidává zaoblení 15 pixelů
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: softItemColor,
                                title: const Text(
                                  "Benchpress",
                                  style: TextStyle(fontSize: 30),
                                ),
                                content: const SizedBox(
                                  height: 400.0, // Maximální výška
                                  width: 300.0, // Maximální šířka
                                  child: Text(
                                    "Popis cviku",
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
                          // Uspořádání do řádku pro horizontální uspořádání
                          children: <Widget>[
                            Image.asset(
                              'assets/Images/squat.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                                width: 10), // Mezera mezi obrázkem a textem
                            Expanded(
                              child: Container(
                                child: const Text(
                                  "Squat",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign
                                      .center, // Zarovnání textu vpravo
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Mezera mezi tlačítky
                    Container(
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: midItemColor,
                        borderRadius: BorderRadius.circular(
                            25.0), // Přidává zaoblení 15 pixelů
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: softItemColor,
                                title: const Text(
                                  "Benchpress",
                                  style: TextStyle(fontSize: 30),
                                ),
                                content: const SizedBox(
                                  height: 400.0, // Maximální výška
                                  width: 300.0, // Maximální šířka
                                  child: Text(
                                    "Popis cviku",
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
                          // Uspořádání do řádku pro horizontální uspořádání
                          children: <Widget>[
                            Image.asset(
                              'assets/Images/squat.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                                width: 10), // Mezera mezi obrázkem a textem
                            Expanded(
                              child: Container(
                                child: const Text(
                                  "Squat",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign
                                      .center, // Zarovnání textu vpravo
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Mezera mezi tlačítky
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: midItemColor,
                        borderRadius: BorderRadius.circular(
                            25.0), // Přidává zaoblení 15 pixelů
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: softItemColor,
                                title: const Text(
                                  "Benchpress1",
                                  style: TextStyle(fontSize: 30),
                                ),
                                content: const SizedBox(
                                  height: 400.0, // Maximální výška
                                  width: 300.0, // Maximální šířka
                                  child: Text(
                                    "Popis cviku",
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
                          // Uspořádání do řádku pro horizontální uspořádání
                          children: <Widget>[
                            Image.asset(
                              'assets/Images/squat.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                                width: 10), // Mezera mezi obrázkem a textem
                            Expanded(
                              child: Container(
                                child: const Text(
                                  "Squat",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign
                                      .center, // Zarovnání textu vpravo
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
            ),
            // Pozadí
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
            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'profile')),
          );
          }
          if (index == 1) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.pushReplacement(
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
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'profile')),
          );
          }
          if (index == 1) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.pushReplacement(
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
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'profile')),
          );
          }
          if (index == 1) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );
          }
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            );
          }
          if (index == 4) {
            Navigator.pushReplacement(
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
