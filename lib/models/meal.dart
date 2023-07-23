class Meal {
  final String mealName;
  final String mealThumb;
  final String idMeal;

  Meal({required this.mealName, required this.mealThumb, required this.idMeal});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      mealName: json['strMeal'] ?? '',
      mealThumb: json['strMealThumb'] ?? '',
      idMeal: json['idMeal'] ?? '',
    );
  }
}

// class Meal {
//   final String strMeal;
//   final String strMealThumb;
//   final String idMeal;

//   Meal({
//     required this.strMeal,
//     required this.strMealThumb,
//     required this.idMeal,
//   });

//   factory Meal.fromJson(Map<String, dynamic> json) {
//     return Meal(
//       strMeal: json['strMeal'] ?? "",
//       strMealThumb: json['strMealThumb'] ?? "",
//       idMeal: json['idMeal'] ?? "",
//     );
//   }
// }
