import 'package:flutter/material.dart';
import 'package:meals_flutter_app/data/dummy_data.dart';
import 'package:meals_flutter_app/models/category.dart';
import 'package:meals_flutter_app/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    List<Meal> meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Text(
          category.title,
        ),
      ),
      body: Column(
        children: meals.map((meal) => Text(meal.title)).toList(),
      ),
    );
  }
}
