import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/meal.dart';
import '../models/meal_list.dart';

class MealProvider with ChangeNotifier {
  late MealList mealList;

  MealListViewModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    // replace the URL with the actual API endpoint
    var response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian'));

    if (response.statusCode == 200) {
      String content = response.body;
      Map<String, dynamic> mealJson = jsonDecode(content);
      mealList = MealList.fromJson(mealJson);
      notifyListeners(); // notify any widgets listening to this model that something has changed
    } else {
      // You might want to throw an exception here, or handle the error in some way
    }
  }

  // List<Meal> _meals = [];

  // List<Meal> get meals => _meals;

  // Future<void> fetchMeals() async {
  //   var url = Uri.parse(
  //       'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert');
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     var mealsData = data['meals'] as List;
  //     _meals = mealsData.map((e) => Meal.fromJson(e)).toList();
  //     notifyListeners();
  //   } else {
  //     throw Exception('Failed to load meals');
  //   }
  // }
}
