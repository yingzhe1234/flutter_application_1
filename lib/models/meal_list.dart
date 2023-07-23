import 'meal.dart';

class MealList {
  final List<Meal> meals;

  MealList({required this.meals});

  factory MealList.fromJson(Map<String, dynamic> json) {
    List<dynamic> mealJsonList = json['meals'] ?? [];

    return MealList(
      meals: mealJsonList
          .map((data) =>
              data is Map<String, dynamic> ? Meal.fromJson(data) : null)
          .where((meal) => meal != null)
          .cast<Meal>()
          .toList(),
    );
  }
}
