import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/meal.dart';
import 'package:meals_flutter_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    }
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (context, index) {
        return MealItem(meal: favoriteMeals[index]);
      },
    );
  }
}
