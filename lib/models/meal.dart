import 'package:meals_flutter_app/models/complexity.dart';
import 'package:meals_flutter_app/models/cost.dart';
import 'package:meals_flutter_app/screens/settings.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  static List<Meal> filterMealsBySettings(
    final List<Meal> meals,
    final Settings settings,
  ) {
    return meals.where((meal) {
      final filterGluten = settings.isGlutenFree && !meal.isVegetarian;
      final filterLactose = meal.isLactoseFree && !meal.isLactoseFree;
      final filterIsVegan = meal.isVegan && !meal.isVegan;
      final filterIsVegetarian = meal.isVegetarian && !meal.isVegetarian;
      return !filterGluten &&
          !filterLactose &&
          !filterIsVegan &&
          !filterIsVegetarian;
    }).toList();
  }
}
