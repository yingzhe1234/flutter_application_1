import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/meal.dart';

// import 'meal_model.dart';

class MealProvider with ChangeNotifier {
  List<Meal> _meals = [];

  List<Meal> get meals => _meals;

  MealProvider() {
    fetchMeals();
  }

  Meal? findMealById(String id) {
    return _meals.firstWhere((meal) => meal.idMeal == id, orElse: () {
      throw Exception('Meal with ID: $id not found');
    });
  }

  Future<void> fetchMeals() async {
    try {
      var url = Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var mealsData = data['meals'] as List;
        _meals = mealsData.map((e) => Meal.fromJson(e)).toList();

        for (int i = 0; i < _meals.length; i++) {
          var detailUrl = Uri.parse(
              'https://themealdb.com/api/json/v1/1/lookup.php?i=${_meals[i].idMeal}');
          var detailResponse = await http.get(detailUrl);
          if (detailResponse.statusCode == 200) {
            var detailData = jsonDecode(detailResponse.body);
            var mealDetailData = detailData['meals']
                [0]; // assuming the API gives a list with a single meal detail
            _meals[i] = Meal.fromJson(
                mealDetailData); // replace the meal with a new one that includes details
          }
        }
        notifyListeners();
      } else {
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      print('Error: $e');
      // You can show an error message to the user or do something else
    }
  }

  Future<Meal> fetchMealDetails(String idMeal) async {
    var url = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Meal.fromJson(data['meals'][0]);
    } else {
      throw Exception('Failed to load meal details');
    }
  }
}
