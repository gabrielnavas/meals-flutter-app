import 'package:flutter/material.dart';
import 'package:meals_flutter_app/screens/categories_meals_screen.dart';
import 'package:meals_flutter_app/screens/meal_detail_screen.dart';
import 'package:meals_flutter_app/screens/settings_screen.dart';
import 'package:meals_flutter_app/screens/tabs_screen.dart';

class Routes {
  static const home = '/';
  static const categories = '/categories-meals';
  static const mealsDetail = '/meal-detail';
  static const settings = '/settings';

  static Map<String, Widget Function(BuildContext context)> getRoutes() {
    return {
      Routes.home: (_) => const TabsScreen(),
      Routes.categories: (_) => const CategoriesMealsScreen(),
      Routes.mealsDetail: (_) => const MealDetailScreen(),
      Routes.settings: (_) => const SettingsScreen(),
    };
  }

  static MaterialPageRoute getRouteNotFound() {
    return MaterialPageRoute(
      // default route if not found
      builder: (_) => const TabsScreen(),
    );
  }
}
