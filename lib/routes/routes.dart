import 'package:flutter/material.dart';
import 'package:meals_flutter_app/routes/route_names.dart';
import 'package:meals_flutter_app/screens/categories_meals_screen.dart';
import 'package:meals_flutter_app/screens/categories_screen.dart';
import 'package:meals_flutter_app/screens/meal_detail_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> getRoutes() {
    return {
      Routenames.home: (_) => const CategoriesScreen(),
      Routenames.categories: (_) => const CategoriesMealsScreen(),
      Routenames.mealsDetail: (_) => const MealDetailScreen()
    };
  }
}
