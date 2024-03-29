import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/category.dart';
import 'package:meals_flutter_app/models/meal.dart';
import 'package:meals_flutter_app/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  List<Meal> meals;

  CategoriesMealsScreen({required this.meals, super.key});

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    List<Meal> mealsFiltred =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Text(
          category.title,
        ),
      ),
      body: ListView.builder(
        itemCount: mealsFiltred.length,
        itemBuilder: (context, index) => MealItem(meal: mealsFiltred[index]),
      ),
    );
  }
}
