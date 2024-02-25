import 'package:flutter/material.dart';
import 'package:meals_flutter_app/screens/tabs_screen.dart';

class Routes {
  static const home = '/';
  static const categories = '/categories-meals';
  static const mealsDetail = '/meal-detail';
  static const settings = '/settings';

  static MaterialPageRoute getRouteNotFound() {
    return MaterialPageRoute(
      // default route if not found
      builder: (_) => const TabsScreen(),
    );
  }
}
