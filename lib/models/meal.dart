class Meal {
  final String idMeal;
  final String mealName;
  final String mealThumb;
  final String mealInstructions;
  final String mealCategory;
  final String mealArea;

  Meal({
    required this.idMeal,
    required this.mealName,
    required this.mealThumb,
    required this.mealInstructions,
    required this.mealCategory,
    required this.mealArea,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'],
      mealName: json['strMeal'],
      mealThumb: json['strMealThumb'],
      mealInstructions: json['strInstructions'] ?? '',
      mealCategory: json['strCategory'] ?? '',
      mealArea: json['strArea'] ?? '',
    );
  }
}
