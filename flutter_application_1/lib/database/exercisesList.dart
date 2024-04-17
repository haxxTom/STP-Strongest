import 'database.dart';

List<Cvik> cviky = [
  // 1. Squats
  Cvik(
    id: 1,
    nazev: "Squats",
    partie: "Legs and Glutes",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 2. Push-ups
  Cvik(
    id: 2,
    nazev: "Push-ups",
    partie: "Chest, Triceps",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 3. Lunges
  Cvik(
    id: 3,
    nazev: "Lunges",
    partie: "Legs and Glutes",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 4. Deadlift
  Cvik(
    id: 4,
    nazev: "Deadlift",
    partie: "Back, Legs, Glutes",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 5. Bench press
  Cvik(
    id: 5,
    nazev: "Bench press",
    partie: "Chest, Triceps",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 6. Pull-ups
  Cvik(
    id: 6,
    nazev: "Pull-ups",
    partie: "Back, Biceps",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 7. Dips
  Cvik(
    id: 7,
    nazev: "Dips",
    partie: "Triceps, Chest",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 8. Plank
  Cvik(
    id: 8,
    nazev: "Plank",
    partie: "Core, Abs",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 9. Squats with dumbbells
  Cvik(
    id: 9,
    nazev: "Dumbbell squats",
    partie: "Legs and Glutes",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 10. Lunges with dumbbells
  Cvik(
    id: 10,
    nazev: "Dumbbell lunges",
    partie: "Legs and Glutes",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 11. Shoulder press
  Cvik(
    id: 11,
    nazev: "Shoulder press",
    partie: "Shoulders",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 12. Bicep curls
  Cvik(
    id: 12,
    nazev: "Bicep curls",
    partie: "Biceps",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 13. Triceps extensions
  Cvik(
    id: 13,
    nazev: "Triceps extensions",
    partie: "Triceps",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 14. Leg press
  Cvik(
    id: 14,
    nazev: "Leg press",
    partie: "Legs",
    obrazek: "assets/Images/icon.png", // Use the same image path for all exercises
  ),

  // 15. Leg extension
  Cvik(
    id: 15,
    nazev: "Leg extension",
    partie: "Quads",
    obrazek: "assets/Images/icon.png",
  ),
];

int compareNatural(String a, String b) {
  return a.toLowerCase().compareTo(b.toLowerCase());
}

List<Cvik>sortedCviky() => cviky.toList()..sort((a, b) => compareNatural(a.nazev, b.nazev));

List<Cvik> scviky = sortedCviky();
