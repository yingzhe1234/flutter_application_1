import 'dart:convert';

import 'package:flutter_application_1/models/meal_list.dart';
import 'package:flutter_application_1/views/meal_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/meal_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/meal_provider.dart';
// import '../meal_list_screen.dart';
import '../views/meal_list_screen.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MealProvider(),
      child: MaterialApp(
        title: 'Meal App',
        home: MealListScreen(),
      ),
    );
  }
}
