import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

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
            _renderSectionTitle('Ingredientes'),
            _renderSectionContainer(ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Colors.accents[14],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    meal.ingredients[index],
                    style: const TextStyle(
                      color: Color.fromARGB(140, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )),
            _renderSectionTitle('Passos'),
            _renderSectionContainer(ListView.builder(
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
            )),
          ],
        ),
      ),
    );
  }

  Container _renderSectionContainer(ListView listView) {
    return Container(
      width: double.infinity,
      height: 350,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: listView,
    );
  }

  Container _renderSectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
