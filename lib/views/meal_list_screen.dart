import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_models/meal_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';

import '../models/meal_list.dart';
import 'meal_detail_screen.dart';
import '../view_models/meal_provider.dart';

class MealListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal List'),
      ),
      body: Consumer<MealProvider>(
        builder: (ctx, mealProvider, _) {
          if (mealProvider.meals.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: mealProvider.meals.length,
              itemBuilder: (context, index) {
                final meal = mealProvider.meals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MealDetailScreen(mealId: meal.idMeal),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Image.network(meal.mealThumb),
                    title: Text(meal.mealName),
                    subtitle: Text('ID: ${meal.idMeal}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
