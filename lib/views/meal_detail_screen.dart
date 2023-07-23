import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_models/meal_provider.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  MealDetailScreen({required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<Meal>(
        future:
            Provider.of<MealProvider>(context, listen: false).fetchData(mealId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            // You can also handle errors here
            return Center(child: Text('An error occurred!'));
          } else {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data!.mealName,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Image.network(snapshot.data!.mealThumb),
                  SizedBox(height: 10),
                  Text(
                    'ID: ${snapshot.data!.idMeal}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}




// class MealDetailScreen extends StatelessWidget {
//   final Meal meal;

//   MealDetailScreen({required this.meal});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(meal.mealName),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.network(meal.mealThumb),
//             Text(meal.mealName),
//             Text('ID: ${meal.idMeal}'),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class MealDetailScreen extends StatelessWidget {
//   final Meal meal;

//   MealDetailScreen({required this.meal});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(meal.mealName),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.network(meal.mealThumb),
//             Text(
//               meal.mealName,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             SizedBox(height: 16),
//             Text('ID: ${meal.idMeal}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
