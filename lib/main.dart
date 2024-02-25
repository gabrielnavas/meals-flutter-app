import 'package:flutter/material.dart';
import 'package:meals_flutter_app/routes.dart';
import 'package:meals_flutter_app/screens/categories_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                fontSize: 15,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
      initialRoute: '/',
      routes: Routes.getRoutes(),
      onUnknownRoute: (settings) => MaterialPageRoute(
        // default route if not found
        builder: (_) => const CategoriesScreen(),
      ),
    );
  }
}
