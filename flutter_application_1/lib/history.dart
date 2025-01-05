import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/exercises.dart';
import 'main.dart';
import 'templates.dart';
import 'random.dart';

class HistoryScreen extends StatelessWidget {
  final infoStyle = const TextStyle(
    fontSize: 12,
    color: Colors.white,
  );


 const HistoryScreen({super.key});
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
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                fixedSize: const Size(350, 150),
                backgroundColor: midItemColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                ),
                

              ),
              onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Workout1 - Datum',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),

                          ),
                        content: SizedBox(
                          width: 350,
                          height: 400,
                          child: Column(
                            children: [
                              const SizedBox( height: 5,),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Exercise',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    ),
                                  Text(
                                    '1 REP MAX',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),                                
                                ],
                              ),
                              const SizedBox(height: 5,), 
                              Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Squat (Barbell)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '(165KG)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3,),                                 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '1: 12x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '165kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '2: 12x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '165kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '3: 12x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '165kg',
                                        style: infoStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bench Press (Barbell)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '(150KG)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3,),                                 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '1: 8x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '150kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '2: 6x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '140kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '3: 5x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '135kg',
                                        style: infoStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bench Press (Dumbell)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '(65KG)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3,),                                 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '1: 8x50KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '65kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '2: 6x50KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '60kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '3: 5x50KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '57,5kg',
                                        style: infoStyle,
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                
                            ],                         
                          ),
                        ),
                          backgroundColor: midItemColor,
                          actions: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            
                          ],
                        );
                      },
                    );
                  },
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text(
                      "Workout1 - datum",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      
                      ),
                    ),
                    const SizedBox( height: 5,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exercise',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          ),
                          Text(
                          'Best set',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          ),
                      
                      ],
                    ),
                    const SizedBox(height: 5,),     
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Squat (Barbell) - 3 Sets',
                          style: infoStyle,
                        ),
                        Text(
                          '120KG - 12Rep',
                          style: infoStyle,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BenchPress (Barbell) - 3 Sets',
                          style: infoStyle,
                        ),
                        Text(
                          '120KG - 8Rep',
                          style: infoStyle,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BenchPress (Dumbell) - 3 Sets',
                          style: infoStyle,
                        ),
                        Text(
                          '50KG - 8Rep',
                          style: infoStyle,
                        )
                      ],
                    ),
                    

                
                  ],

                ),
              
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                fixedSize: const Size(350, 150),
                backgroundColor: midItemColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                ),
                

              ),
              onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Workout2 - Datum',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),

                          ),
                        content: SizedBox(
                          width: 350,
                          height: 400,
                          child: Column(
                            children: [
                              const SizedBox( height: 5,),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Exercise',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    ),
                                  Text(
                                    '1 REP MAX',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),                                
                                ],
                              ),
                              const SizedBox(height: 5,), 
                              Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Squat (Barbell)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '(165KG)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3,),                                 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '1: 12x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '165kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '2: 12x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '165kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '3: 12x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '165kg',
                                        style: infoStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bench Press (Barbell)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '(150KG)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3,),                                 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '1: 8x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '150kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '2: 6x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '140kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '3: 5x120KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '135kg',
                                        style: infoStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bench Press (Dumbell)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '(65KG)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3,),                                 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '1: 8x50KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '65kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '2: 6x50KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '60kg',
                                        style: infoStyle,
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                                  
                                      Text(
                                        '3: 5x50KG',
                                        style: infoStyle,
                                      ),
                                      Text(
                                        '57,5kg',
                                        style: infoStyle,
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                
                            ],                         
                          ),
                        ),
                          backgroundColor: midItemColor,
                          actions: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            
                          ],
                        );
                    },
                  );
                },
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  const Text(
                    "Workout2 - datum",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    
                    ),
                  ),
                  const SizedBox( height: 5,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exercise',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        ),
                        Text(
                        'Best set',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        ),
                     
                    ],
                  ),
                  const SizedBox(height: 5,),     
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Squat (Barbell) - 3 Sets',
                        style: infoStyle,
                      ),
                      Text(
                        '120KG - 12Rep',
                        style: infoStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'BenchPress (Barbell) - 3 Sets',
                        style: infoStyle,
                      ),
                      Text(
                        '120KG - 8Rep',
                        style: infoStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'BenchPress (Dumbell) - 3 Sets',
                        style: infoStyle,
                      ),
                      Text(
                        '50KG - 8Rep',
                        style: infoStyle,
                      )
                    ],
                  ),
                  

              
                ],

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
            icon: const Icon(Icons.add),
            label: 'Templates',
          ),
          BottomNavigationBarItem(
            backgroundColor: mainBackgroundColor,
            icon: const Padding(
              padding: EdgeInsets.all(0), // Adjust the padding here
              child: Icon(Icons.fitness_center),
            ),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            backgroundColor: mainBackgroundColor,
            icon: const Padding(
              padding: EdgeInsets.all(0), // Adjust the padding here
              child: Icon(Icons.alarm),
            ),
            label: 'History',
          )
        ],
      ),
    );
  }
}
