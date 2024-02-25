import 'package:flutter/material.dart';
import 'package:meals_flutter_app/data/dummy_data.dart';
import 'package:meals_flutter_app/models/meal.dart';
import 'package:meals_flutter_app/routes.dart';
import 'package:meals_flutter_app/screens/categories_meals_screen.dart';
import 'package:meals_flutter_app/screens/meal_detail_screen.dart';
import 'package:meals_flutter_app/screens/settings.dart';
import 'package:meals_flutter_app/screens/settings_screen.dart';
import 'package:meals_flutter_app/screens/tabs_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Meal> _avaliableMeals = dummyMeals;
  Settings settings = Settings();

  void onSettingsChanged(Settings sett) {
    _avaliableMeals = Meal.filterMealsBySettings(dummyMeals, sett);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMealsApp',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        primaryColor: Colors.blue,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 242, 226),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                fontSize: 15,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        Routes.home: (_) => const TabsScreen(),
        Routes.categories: (_) => CategoriesMealsScreen(
              meals: _avaliableMeals,
            ),
        Routes.mealsDetail: (_) => const MealDetailScreen(),
        Routes.settings: (_) => SettingsScreen(
            settings: settings, onSettingsChanged: onSettingsChanged),
      },
      onUnknownRoute: (settings) => Routes.getRouteNotFound(),
    );
  }
}
