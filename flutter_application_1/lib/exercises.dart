import 'package:flutter/material.dart';
import 'main.dart';
import 'templates.dart';
import 'random.dart';
import 'history.dart';

class FourthScreen extends StatelessWidget {
  
  FourthScreen({Key? key}) : super(key: key);
  
  final String C = "Core";
  final String A = "Arms";
  final String B =  "Back";
  final String Ch = "Chest";
  final String L = "Legs";
  final String S = "Shoulders";
  final String O = "Other";
  final String Fb = "Full Body";
  final String Ca = "Cardio";

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
                              
                              content: 
                              Container(
                                width: 200,
                                height: 200,
                                  
                                  child: Column(
                                    children: [
                                      
                                      SizedBox(
                                        height: 35,
                                        width: 125,
                                        child: TextButton(
                                        onPressed: null, // This button has no action
                                      
                                        style: ButtonStyle(
                                          // Set width and height
                                          backgroundColor: MaterialStateProperty.all(
                                              midItemColor), // Set background color
                                        ),
                                        child: const Text(
                                          "Chest",
                                          style: TextStyle(color: Colors.white, fontSize: 12.5),
                                        ),
                                      ),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),
                                      
                                      SizedBox(
                                        height: 35,
                                        width: 125,
                                        child: 
                                        TextButton(
                                        onPressed: null, // This button has no action
                                      
                                        style: ButtonStyle(
                                          // Set width and height
                                          backgroundColor: MaterialStateProperty.all(
                                              midItemColor), // Set background color
                                        ),
                                        child: const Text(
                                          "Shoulders",
                                          style: TextStyle(color: Colors.white, fontSize: 12.5),
                                        ),
                                      ),
                                      ), 

                                      SizedBox(
                                        height: 5,
                                      ),
                                      
                                      SizedBox(
                                        height: 35,
                                        width: 125,
                                        child: 
                                        TextButton(
                                        onPressed: null, // This button has no action
                                      
                                        style: ButtonStyle(
                                          // Set width and height
                                          backgroundColor: MaterialStateProperty.all(
                                              midItemColor), // Set background color
                                        ),
                                        child: const Text(
                                          "Arms",
                                          style: TextStyle(color: Colors.white, fontSize: 12.5),
                                        ),
                                      ),
                                      ), 
                                      SizedBox(
                                        height: 5,
                                      ),
                                      
                                      SizedBox(
                                        height: 35,
                                        width: 125,
                                        child: 
                                        TextButton(
                                        onPressed: null, // This button has no action
                                      
                                        style: ButtonStyle(
                                          // Set width and height
                                          backgroundColor: MaterialStateProperty.all(
                                              midItemColor), // Set background color
                                        ),
                                        child: const Text(
                                          "Back",
                                          style: TextStyle(color: Colors.white, fontSize: 12.5),
                                        ),
                                      ),
                                      ), 
                                      SizedBox(
                                        height: 5,
                                      ),
                                      
                                      SizedBox(
                                        height: 35,
                                        width: 125,
                                        child: 
                                        TextButton(
                                        onPressed: null, // This button has no action
                                      
                                        style: ButtonStyle(
                                          // Set width and height
                                          backgroundColor: MaterialStateProperty.all(
                                              midItemColor), // Set background color
                                        ),
                                        child: const Text(
                                          "Legs",
                                          style: TextStyle(color: Colors.white, fontSize: 12.5),
                                        ),
                                      ),
                                      ), 
                                          
                                          
                                          
                                      
                                    ],
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
                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("A", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: midItemColor,
                        borderRadius: BorderRadius.circular(
                            25.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: softItemColor,
                                title: const Text(
                                  "Ab Wheel",
                                  style: TextStyle(fontSize: 30),
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
                          // Uspořádání do řádku pro horizontální uspořádání
                          children:[
                            Image.asset(
                              'assets/Images/icon.png',
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
                                    const Text(
                                      "Ab Wheel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                       // Zarovnání textu vpravo
                                    ),
                                    Text(
                                      C, 
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

                    const SizedBox(height: 10), // Mezera mezi tlačítky
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
                                  "Aerobics",
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
                          children:[
                            Image.asset(
                              'assets/Images/icon.png',
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
                                    const Text(
                                      "Aerobics",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                       // Zarovnání textu vpravo
                                    ),
                                    Text(
                                      Ca, 
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

                    const SizedBox(height: 10), // Mezera mezi tlačítky
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
                                  "Arnold Press",
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
                          children:[
                            Image.asset(
                              'assets/Images/icon.png',
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
                                    const Text(
                                      "Arnold Press (Dumbell)",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                       // Zarovnání textu vpravo
                                    ),
                                    Text(
                                      S, 
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

                    const SizedBox(height: 10), // Mezera mezi tlačítky
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
                                  "Around the World",
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
                          children:[
                            Image.asset(
                              'assets/Images/icon.png',
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
                                    const Text(
                                      "Around the World",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                       // Zarovnání textu vpravo
                                    ),
                                    Text(
                                      Ch, 
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

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("B", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                     
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
                                  "Back Extension",
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
                          children:[
                            Image.asset(
                              'assets/Images/icon.png',
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
                                    const Text(
                                      "Back Extension",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                       // Zarovnání textu vpravo
                                    ),
                                    Text(
                                      B, 
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

                    const SizedBox(height: 10), // Mezera mezi tlačítky
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
                                  "Back Extension (Machine)",
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
                          children:[
                            Image.asset(
                              'assets/Images/icon.png',
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
                                    const Text(
                                      "Back Extension (Machine)",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                       // Zarovnání textu vpravo
                                    ),
                                    Text(
                                      B, 
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

                    const SizedBox(height: 10), // Mezera mezi tlačítky
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
                                  "Back Extension (Machine)",
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
                          children:[
                            Image.asset(
                              'assets/Images/icon.png',
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
                                    const Text(
                                      "Ball Slams",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                       // Zarovnání textu vpravo
                                    ),
                                    Text(
                                      Fb, 
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


                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("C", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("D", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("E", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("F", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("G", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("H", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("I", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("J", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("K", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("L", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("M", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("N", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("O", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("P", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("Q", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("R", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("S", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("T", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("U", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("V", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("W", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("X", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("Y", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                    ),

                    const SizedBox(
                      width: 350,
                      height: 30,
                      child: Text("Z", 
                      style: TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
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
          if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FifthScreen()),
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
