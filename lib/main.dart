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
  List<Meal> avaliableMeals = dummyMeals;
  List<Meal> favorite = [];

  Settings settings = Settings();

  void onSettingsChanged(Settings sett) {
    avaliableMeals = Meal.filterMealsBySettings(dummyMeals, sett);
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      if (favorite.contains(meal)) {
        favorite.remove(meal);
      } else {
        favorite.add(meal);
      }
    });
  }

  bool _isFavorite(Meal meal) {
    return favorite.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    Widget tabScreen = TabsScreen(
      favoriteMeals: favorite,
    );
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
        Routes.home: (_) => tabScreen,
        Routes.categories: (_) => CategoriesMealsScreen(
              meals: avaliableMeals,
            ),
        Routes.mealsDetail: (_) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, mealIsFavorite: _isFavorite),
        Routes.settings: (_) => SettingsScreen(
            settings: settings, onSettingsChanged: onSettingsChanged),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        // default route if not found
        builder: (_) => tabScreen,
      ),
    );
  }
}
