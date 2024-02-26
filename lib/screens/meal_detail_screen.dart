import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final void Function(Meal meal) toggleFavorite;
  final bool Function(Meal meal) mealIsFavorite;

  const MealDetailScreen(
      {required this.toggleFavorite, required this.mealIsFavorite, super.key});

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Text(
          meal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _renderSectionTitle('Ingredientes', Icons.restaurant_menu_sharp),
            Container(
                width: double.infinity,
                height: meal.ingredients.length * 42,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    color: const Color.fromARGB(133, 255, 226, 226),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      child: Text(
                        meal.ingredients[index],
                        style: const TextStyle(
                          color: Color.fromARGB(202, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )),
            _renderSectionTitle('Passos', Icons.factory_outlined),
            Container(
              width: double.infinity,
              height: meal.ingredients.length * 84,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.accents[5],
                        foregroundColor: Colors.black87,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber.shade400,
        onPressed: () {
          // Navigator.of(context).pop(meal);
          toggleFavorite(meal);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Icon(
          mealIsFavorite(meal) ? Icons.star_border : Icons.star,
        ),
      ),
    );
  }

  Container _renderSectionTitle(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Icon(icon),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
