import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_models/meal_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';

import '../models/meal_list.dart';
import 'meal_detail_screen.dart';

class MealListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dessert Meals'),
      ),
      body: Consumer<MealProvider>(
        builder: (context, model, child) {
          if (model.mealList == null) {
            // Display a loading indicator while the meal data is being fetched
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: model.mealList!.meals.length,
              itemBuilder: (context, index) {
                final meal = model.mealList!.meals[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MealDetailScreen(mealId: meal.idMeal),
                    ),
                  ),
                  child: ListTile(
                    title: Text(meal.mealName),
                    leading: Image.network(meal.mealThumb),
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



// class MealListScreen extends StatelessWidget {
//   final MealList mealList;

//   MealListScreen({Key? key, required this.mealList}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Meal List'),
//       ),
//       body: ListView.builder(
//         itemCount: mealList.meals.length,
//         itemBuilder: (context, index) {
//           final meal = mealList.meals[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MealDetailScreen(meal: meal),
//                 ),
//               );
//             },
//             child: ListTile(
//               leading: Image.network(meal.mealThumb),
//               title: Text(meal.mealName),
//               subtitle: Text('ID: ${meal.idMeal}'),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('Dessert Meals'),
//   //     ),
//   //     body: ListView.builder(
//   //       itemCount: mealList.meals.length,
//   //       itemBuilder: (context, index) {
//   //         final meal = mealList.meals[index];

//   //         return ListTile(
//   //           leading: FutureBuilder(
//   //             future: DefaultCacheManager().getSingleFile(meal.mealThumb),
//   //             builder: (BuildContext context, AsyncSnapshot snapshot) {
//   //               if (snapshot.connectionState == ConnectionState.waiting) {
//   //                 return Container(
//   //                   width: 50,
//   //                   height: 50,
//   //                   child: CircularProgressIndicator(),
//   //                 );
//   //               } else {
//   //                 return Image.file(
//   //                   snapshot.data!,
//   //                   width: 50,
//   //                   height: 50,
//   //                   fit: BoxFit.cover,
//   //                 );
//   //               }
//   //             },
//   //           ),
//   //           title: Text(meal.mealName),
//   //           onTap: () {
//   //             // Handle onTap here. For example, you can navigate to the meal detail screen.
//   //           },
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
// }
