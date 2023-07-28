import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/meal_provider.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealId;

  MealDetailScreen({Key? key, required this.mealId}) : super(key: key);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Meal? meal;

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  void fetchDetails() async {
    try {
      meal = await Provider.of<MealProvider>(context, listen: false)
          .fetchMealDetails(widget.mealId);
      setState(() {});
    } catch (e) {
      // handle error
      print("Fetch meal detail data error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal?.mealName ?? 'Loading...'),
      ),
      body: meal != null
          ? ListView(
              children: <Widget>[
                if (meal!.mealThumb != null) Image.network(meal!.mealThumb!),
                ListTile(
                  title: Text('Instructions'),
                  subtitle: Text(
                      meal?.mealInstructions ?? 'No instructions provided'),
                ),
                ListTile(
                  title: Text('Category'),
                  subtitle: Text(meal?.mealCategory ?? 'No category provided'),
                ),
                ListTile(
                  title: Text('Area'),
                  subtitle: Text(meal?.mealArea ?? 'No area provided'),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/view_models/meal_provider.dart';
// import 'package:provider/provider.dart';

// import '../models/meal.dart';

// class MealDetailScreen extends StatelessWidget {
//   final String mealId;

//   MealDetailScreen({Key? key, required this.mealId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var mealProvider = Provider.of<MealProvider>(context);
//     final meal = mealProvider.findMealById(mealId);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Meal Detail'),
//       ),
//       body: meal != null
//           ? Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(meal.mealName,
//                       style: Theme.of(context).textTheme.headline6),
//                   SizedBox(height: 8),
//                   Image.network(meal.mealThumb),
//                   SizedBox(height: 8),
//                   Text('Instructions: ${meal.mealInstructions}'),
//                   SizedBox(height: 8),
//                   Text('Category: ${meal.mealCategory}'),
//                   SizedBox(height: 8),
//                   Text('Area: ${meal.mealArea}'),
//                 ],
//               ),
//             )
//           : Center(child: Text('Loading...')),
//     );
//   }
// }
