import 'package:flutter/material.dart';
import 'package:meals_flutter_app/data/dummy_data.dart';
import 'package:meals_flutter_app/models/category.dart';
import 'package:meals_flutter_app/models/meal.dart';
import 'package:meals_flutter_app/routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      Routes.categories,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 15;

    List<Widget> stackChildren = [
      Positioned(
        top: 20,
        left: 4,
        child: Container(
          color: const Color.fromARGB(149, 0, 0, 0),
          padding: const EdgeInsets.all(5),
          child: Text(
            category.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    ];

    List<Meal> meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    if (meals.isNotEmpty) {
      Meal meal = meals[0];
      stackChildren.insert(
        0,
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.network(
            meal.imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    Container container = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.5),
            category.color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: stackChildren,
      ),
    );

    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: container,
    );
  }
}
