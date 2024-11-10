import 'database.dart';

List<Cvik> cviky = [
  // 1. Squats
  Cvik(
    id: 1,
    nazev: "Ab Wheel",
    partie: "Core",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "Test",
  ),

  // 2. Push-ups
  Cvik(
    id: 2,
    nazev: "Aerobics",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 3. Lunges
  Cvik(
    id: 3,
    nazev: "Arnold Press (Dumbell)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 4. Deadlift
  Cvik(
    id: 4,
    nazev: "Around the World",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 5. Bench press
  Cvik(
    id: 5,
    nazev: "Back Extension",
    partie: "Back",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 6. Pull-ups
  Cvik(
    id: 6,
    nazev: "Back Extension (Machine)",
    partie: "Back",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 7. Dips
  Cvik(
    id: 7,
    nazev: "Ball Slams",
    partie: "Full Body",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 8. Plank
  Cvik(
    id: 8,
    nazev: "Battle Ropes",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 9. Squats with dumbbells
  Cvik(
    id: 9,
    nazev: "Bench Dip",
    partie: "Arms",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 10. Lunges with dumbbells
  Cvik(
    id: 10,
    nazev: "Bench Press (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 11. Shoulder press
  Cvik(
    id: 11,
    nazev: "Bench Press (Cable)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 12. Bicep curls
  Cvik(
    id: 12,
    nazev: "Bench Press (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 13. Triceps extensions
  Cvik(
    id: 13,
    nazev: "Bench Press\n(Smith Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 14. Leg press
  Cvik(
    id: 14,
    nazev: "Bent Over Row (Band)",
    partie: "Back",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
    popis: "popis",
  ),

  // 15. Leg extension
  Cvik(
    id: 15,
    nazev: "Bent Over Row (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  // 16. Leg extension
  Cvik(
    id: 16,
    nazev: "Bent Over Row (Dumbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  // 17. Leg extension
  Cvik(
    id: 17,
    nazev: "Bent Over Row - Underhand (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  // 17. Leg extension
  Cvik(
    id: 18,
    nazev: "Bicep Curl (Barbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  // 17. Leg extension
  Cvik(
    id: 19,
    nazev: "Bicep Curl (Cable)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 20,
    nazev: "Bicep Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 21,
    nazev: "Bicep Curl (Machine)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 22,
    nazev: "Bicycle Crunch)",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 23,
    nazev: "Box Jump",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 24,
    nazev: "Box Squat (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 25,
    nazev: "Bulgarian Split Squat",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 26,
    nazev: "Burpee",
    partie: "Full Body",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 27,
    nazev: "Cable Crossover",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 28,
    nazev: "Cable Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 29,
    nazev: "Cable Kickback",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 30,
    nazev: "Cable Pull Through",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 31,
    nazev: "Cable Twist",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 32,
    nazev: "Calf Press on Leg Press",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 33,
    nazev: "Calf Press on Seated Leg Press",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 34,
    nazev: "Chest Dip",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 35,
    nazev: "Chest Fly",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 36,
    nazev: "Chest Fly (Band)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 37,
    nazev: "Chest Fly (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 38,
    nazev: "Chest Press (Band)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 39,
    nazev: "Chest Press (Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 40,
    nazev: "Chin Up",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 41,
    nazev: "Chin Up (Assisted)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 42,
    nazev: "Clean (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 43,
    nazev: "Clean and Jerk (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 44,
    nazev: "Climbing",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 45,
    nazev: "Concentration Curl",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 46,
    nazev: "Cross Body Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 47,
    nazev: "Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 48,
    nazev: "Crunch (Machine)",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 49,
    nazev: "Crunch (Stability Ball)",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 50,
    nazev: "Cycling",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 51,
    nazev: "Cycling (Indoor)",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 52,
    nazev: "Deadlift (Band)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 53,
    nazev: "Deadlift (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 54,
    nazev: "Deadlift (Dumbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 55,
    nazev: "Deadlift (Smith Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 56,
    nazev: "Deadlift High Pull (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 57,
    nazev: "Decline Bench Press (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 58,
    nazev: "Decline Bench Press (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 59,
    nazev: "Decline Bench Press (Smith Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 60,
    nazev: "Decline Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 61,
    nazev: "Deficit Deadlift (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 62,
    nazev: "Elliptical Machine",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 63,
    nazev: "Face Pull (Cable)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 64,
    nazev: "Flat Knee Raise",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 65,
    nazev: "Flat Leg Raise",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 66,
    nazev: "Floor Press (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 67,
    nazev: "Front Raise (Band)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 68,
    nazev: "Front Raise (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 69,
    nazev: "Front Raise (Cable)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 70,
    nazev: "Front Raise (Dumbell)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 71,
    nazev: "Front Raise (Plate)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 72,
    nazev: "Front Squat (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 73,
    nazev: "Glute Ham Raise",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 74,
    nazev: "Glute Kickback (Machine)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 75,
    nazev: "Goblet Squat (Kettlebell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 77,
    nazev: "Good Morning (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 78,
    nazev: "Hack Squat (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 79,
    nazev: "Hammer Curl (Band)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 80,
    nazev: "Hammer Curl (Cable)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 81,
    nazev: "Hammer Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 82,
    nazev: "Handstand Push Up",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 83,
    nazev: "Hang Clean (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 84,
    nazev: "Hang Snatch (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 85,
    nazev: "Hanging Knee Raise",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 86,
    nazev: "Hanging Leg Raise",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 87,
    nazev: "High Knee Skips",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 88,
    nazev: "Hiking",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 89,
    nazev: "Hip Abductor (Machine)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 90,
    nazev: "Hip Thrust (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 91,
    nazev: "Hip Thrust (Bodyweight)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 92,
    nazev: "Incline Bench Press (Barbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 93,
    nazev: "Incline Bench Press (Cable)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 94,
    nazev: "Incline Bench Press (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 95,
    nazev: "Incline Bench Press (Smith Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 96,
    nazev: "Incline Chest Fly (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 97,
    nazev: "Incline Chest Press (Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 98,
    nazev: "Incline Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 99,
    nazev: "Incline Row (Dumbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 100,
    nazev: "Inverted Row (Bodyweight)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 101,
    nazev: "Iso-Lateral Chest Press (Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 102,
    nazev: "Iso-Lateral Row (Machine)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 103,
    nazev: "Jackknife Sit Up",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 104,
    nazev: "Jump Rope",
    partie: "Cardio",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 105,
    nazev: "Jump Shrug (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 106,
    nazev: "Jump Squat",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 107,
    nazev: "Jumping Jack",
    partie: "Full Body",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 108,
    nazev: "Kettlebell Swing",
    partie: "Full Body",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 109,
    nazev: "Kettlebell Turkish Get Up",
    partie: "Full Body",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 110,
    nazev: "Kipping Pull Up",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 111,
    nazev: "Knee Raise (Captain's Chair)",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 112,
    nazev: "Kneeling Pulldown (Band)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 113,
    nazev: "Knees to Elbows",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 114,
    nazev: "Lat Pulldown (Cable)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 115,
    nazev: "Lat Pulldown (Machine)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 116,
    nazev: "Lat Pulldown (Single Arm)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 117,
    nazev: "Lat Pulldown - Underhand (Band)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 118,
    nazev: "Lat Pulldown - Underhand (Cable)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 119,
    nazev: "Lat Pulldown - Wide Grip (Cable)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 120,
    nazev: "Lateral Box Jump",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 121,
    nazev: "Lateral Raise (Band)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 122,
    nazev: "Lateral Raise (Cable)",
    partie: "shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 123,
    nazev: "Lateral Raise (Dumbell)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 124,
    nazev: "Lateral Raise (Machine)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 125,
    nazev: "Leg Extension (Machine)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 126,
    nazev: "Leg Press",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 127,
    nazev: "Lunge (Barbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 128,
    nazev: "Lunge (Bodyweight)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 129,
    nazev: "Lunge (Dumbell)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 130,
    nazev: "Lying Leg Curl (Machine)",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 131,
    nazev: "Mountain Climber",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 132,
    nazev: "Muscle Up",
    partie: "Full Body",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 133,
    nazev: "Oblique Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 134,
    nazev: "Overhead Press (Barbell)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 135,
    nazev: "Overhead Press (Cable)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 136,
    nazev: "Overhead Press (Dumbell)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 137,
    nazev: "Overhead Press (Smith Machine)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 138,
    nazev: "Overhead Squat (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 139,
    nazev: "Pec Deck (Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 140,
    nazev: "Pendlay Row",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 141,
    nazev: "Pistol Squat",
    partie: "Legs",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 142,
    nazev: "Plank",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 143,
    nazev: "Power Clean",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 144,
    nazev: "Power Snatch (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 145,
    nazev: "Preacher Curl (Barbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 146,
    nazev: "Preacher Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 147,
    nazev: "Preacher Curl (Machine)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 148,
    nazev: "Press Under (Barbell)",
    partie: "Olympic",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 149,
    nazev: "Pull Up",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 150,
    nazev: "Pull Up (Assisted)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 151,
    nazev: "Pull Up (Band)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 152,
    nazev: "Pullover (Dumbell)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 153,
    nazev: "Pullover (Machine)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 154,
    nazev: "Push Press",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 155,
    nazev: "Push Up",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 156,
    nazev: "Push Up (Band)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 157,
    nazev: "Push Up (Knees)",
    partie: "Chest",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 158,
    nazev: "Rack Pull (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 159,
    nazev: "Reverse Crunch",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 160,
    nazev: "Reverse Curl (Band)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 161,
    nazev: "Reverse Curl (Barbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 162,
    nazev: "Reverse Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popisss",
  ),

  Cvik(
    id: 163,
    nazev: "Reverse Fly (Cable)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 164,
    nazev: "Reverse Fly (Dumbell)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 165,
    nazev: "Reverse Fly (Machine)",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 166,
    nazev: "Reverse Grip Concentration Curl (Dumbell)",
    partie: "Arms",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 167,
    nazev: "Reverse Plank",
    partie: "Core",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 168,
    nazev: "Romanian Deadlift (Barbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),

  Cvik(
    id: 169,
    nazev: "Romanian Deadlift (Dumbell)",
    partie: "Back",
    obrazek: "assets/Images/icon.png",
    popis: "popis",
  ),



];

int compareNatural(String a, String b) {
  return a.toLowerCase().compareTo(b.toLowerCase());
}

List<Cvik>sortedCviky() => cviky.toList()..sort((a, b) => compareNatural(a.nazev, b.nazev));

List<Cvik> scviky = sortedCviky();



