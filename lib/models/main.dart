import 'dart:convert';

import 'package:flutter_application_1/models/meal_list.dart';
import 'package:flutter_application_1/views/meal_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/meal_provider.dart';

void main() {
  // runApp(MealApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => MealProvider(),
      child: MealApp(),
    ),
  );
}

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dessert Meals',
      home: Consumer<MealProvider>(
        builder: (context, viewModel, child) =>
            MealListScreen(mealList: viewModel.mealList),
      ),
    );
  }
}

// class MealApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String jsonString = '''
//     {
//       "meals": [
//         {
//           "strMeal": "Apam balik",
//           "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
//           "idMeal": "53049"
//         },
//         {
//           "strMeal": "Apple & Blackberry Crumble",
//           "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
//           "idMeal": "52893"
//         }
//       ]
//     }
//     ''';

//     Map<String, dynamic> mealJson = jsonDecode(jsonString);
//     var mealList = MealList.fromJson(mealJson);

//     return MaterialApp(
//       title: 'Dessert Meals',
//       home: MealListScreen(mealList: mealList),
//     );
//   }
// }
