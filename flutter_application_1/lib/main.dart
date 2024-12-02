import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/exercises.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'random.dart';
import 'templates.dart';
import 'history.dart';
import 'database/db_helper.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Tento řádek zajišťuje, že Flutter je připraven před spuštěním aplikace.

  await initializeDatabase();  // Zavolá metodu, která inicializuje databázi a naplní ji výchozími cviky

  runApp(MyApp());
}

Color darkItemColor = const Color(0xFF0A0901);
Color mainBackgroundColor = const Color(0xFF3C3C3C);
Color midItemColor = const Color (0xFF918A00);
Color softItemColor = const Color(0xFFFFE500);

String buttonText = 'Name';
String? imageFilePath;

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

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
        home: const ProfileScreen(
          title: 'profile',
        ));
  }
}

class ProfileScreen extends StatefulWidget {
 const ProfileScreen({super.key, required this.title});

  final String title;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  

  void changeusernameFunction(
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
            enteredText = value; // Update enteredText when the text field changes
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
              onPressed: () => changeusernameFunction(context, _updateButtonText),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Exercises()),
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
              MaterialPageRoute(builder: (context) =>  Exercises()),
            );
          }
          if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  const HistoryScreen()),
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



