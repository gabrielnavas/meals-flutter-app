import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Text(
          meal.title,
        ),
      ),
    );
  }
}
