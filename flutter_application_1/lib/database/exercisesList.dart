import 'database.dart';

List<Cvik> cviky = [
  // 1. Squats
  Cvik(
    id: 1,
    nazev: "Ab Wheel",
    partie: "Core",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 2. Push-ups
  Cvik(
    id: 2,
    nazev: "Aerobics",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 3. Lunges
  Cvik(
    id: 3,
    nazev: "Arnold Press (Dumbell)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 4. Deadlift
  Cvik(
    id: 4,
    nazev: "Around the World",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 5. Bench press
  Cvik(
    id: 5,
    nazev: "Back Extension",
    partie: "Back",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 6. Pull-ups
  Cvik(
    id: 6,
    nazev: "Back Extension (Machine)",
    partie: "Back",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 7. Dips
  Cvik(
    id: 7,
    nazev: "Ball Slams",
    partie: "Full Body",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 8. Plank
  Cvik(
    id: 8,
    nazev: "Battle Ropes",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 9. Squats with dumbbells
  Cvik(
    id: 9,
    nazev: "Bench Dip",
    partie: "Arms",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 10. Lunges with dumbbells
  Cvik(
    id: 10,
    nazev: "Bench Press (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 11. Shoulder press
  Cvik(
    id: 11,
    nazev: "Bench Press (Cable)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 12. Bicep curls
  Cvik(
    id: 12,
    nazev: "Bench Press (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 13. Triceps extensions
  Cvik(
    id: 13,
    nazev: "Bench Press\n(Smith Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 14. Leg press
  Cvik(
    id: 14,
    nazev: "Bent Over Row (Band)",
    partie: "Back",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 15. Leg extension
  Cvik(
    id: 15,
    nazev: "Bent Over Row (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  // 16. Leg extension
  Cvik(
    id: 16,
    nazev: "Bent Over Row (Dumbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  // 17. Leg extension
  Cvik(
    id: 17,
    nazev: "Bent Over Row - Underhand (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  // 17. Leg extension
  Cvik(
    id: 18,
    nazev: "Bicep Curl (Barbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  // 17. Leg extension
  Cvik(
    id: 19,
    nazev: "Bicep Curl (Cable)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 20,
    nazev: "Bicep Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 21,
    nazev: "Bicep Curl (Machine)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 22,
    nazev: "Bicycle Crunch)",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 23,
    nazev: "Box Jump",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 24,
    nazev: "Box Squat (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 25,
    nazev: "Bulgarian Split Squat",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 26,
    nazev: "Burpee",
    partie: "Full Body",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 27,
    nazev: "Cable Crossover",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 28,
    nazev: "Cable Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 29,
    nazev: "Cable Kickback",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 30,
    nazev: "Cable Pull Through",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 31,
    nazev: "Cable Twist",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 32,
    nazev: "Calf Press on Leg Press",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 33,
    nazev: "Calf Press on Seated Leg Press",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 34,
    nazev: "Chest Dip",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 35,
    nazev: "Chest Fly",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 36,
    nazev: "Chest Fly (Band)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 37,
    nazev: "Chest Fly (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 38,
    nazev: "Chest Press (Band)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 39,
    nazev: "Chest Press (Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 40,
    nazev: "Chin Up",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 41,
    nazev: "Chin Up (Assisted)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 42,
    nazev: "Clean (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 43,
    nazev: "Clean and Jerk (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 44,
    nazev: "Climbing",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 45,
    nazev: "Concentration Curl",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 46,
    nazev: "Cross Body Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 47,
    nazev: "Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 48,
    nazev: "Crunch (Machine)",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 49,
    nazev: "Crunch (Stability Ball)",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 50,
    nazev: "Cycling",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 51,
    nazev: "Cycling (Indoor)",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 52,
    nazev: "Deadlift (Band)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 53,
    nazev: "Deadlift (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 54,
    nazev: "Deadlift (Dumbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 55,
    nazev: "Deadlift (Smith Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 56,
    nazev: "Deadlift High Pull (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 57,
    nazev: "Decline Bench Press (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 58,
    nazev: "Decline Bench Press (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 59,
    nazev: "Decline Bench Press (Smith Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 60,
    nazev: "Decline Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 61,
    nazev: "Deficit Deadlift (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 62,
    nazev: "Elliptical Machine",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 63,
    nazev: "Face Pull (Cable)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 64,
    nazev: "Flat Knee Raise",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 65,
    nazev: "Flat Leg Raise",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 66,
    nazev: "Floor Press (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 67,
    nazev: "Front Raise (Band)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 68,
    nazev: "Front Raise (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 69,
    nazev: "Front Raise (Cable)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 70,
    nazev: "Front Raise (Dumbell)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 71,
    nazev: "Front Raise (Plate)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 72,
    nazev: "Front Squat (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 73,
    nazev: "Glute Ham Raise",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 74,
    nazev: "Glute Kickback (Machine)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 75,
    nazev: "Goblet Squat (Kettlebell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 77,
    nazev: "Good Morning (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 78,
    nazev: "Hack Squat (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 79,
    nazev: "Hammer Curl (Band)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 80,
    nazev: "Hammer Curl (Cable)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 81,
    nazev: "Hammer Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 82,
    nazev: "Handstand Push Up",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 83,
    nazev: "Hang Clean (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 84,
    nazev: "Hang Snatch (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 85,
    nazev: "Hanging Knee Raise",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 86,
    nazev: "Hanging Leg Raise",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 87,
    nazev: "High Knee Skips",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 88,
    nazev: "Hiking",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 89,
    nazev: "Hip Abductor (Machine)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 90,
    nazev: "Hip Thrust (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 91,
    nazev: "Hip Thrust (Bodyweight)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 92,
    nazev: "Incline Bench Press (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 93,
    nazev: "Incline Bench Press (Cable)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 94,
    nazev: "Incline Bench Press (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 95,
    nazev: "Incline Bench Press (Smith Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 96,
    nazev: "Incline Chest Fly (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 97,
    nazev: "Incline Chest Press (Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 98,
    nazev: "Incline Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 99,
    nazev: "Incline Row (Dumbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 100,
    nazev: "Inverted Row (Bodyweight)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 101,
    nazev: "Iso-Lateral Chest Press (Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 102,
    nazev: "Iso-Lateral Row (Machine)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
  ),

  Cvik(
    id: 103,
    nazev: "Jackknife Sit Up",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
  ),
];

int compareNatural(String a, String b) {
  return a.toLowerCase().compareTo(b.toLowerCase());
}

List<Cvik>sortedCviky() => cviky.toList()..sort((a, b) => compareNatural(a.nazev, b.nazev));

List<Cvik> scviky = sortedCviky();
