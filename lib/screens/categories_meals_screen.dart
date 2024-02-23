import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final Category category;

  const CategoriesMealsScreen(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Text(
          category.title,
        ),
      ),
      body: Center(
        child: Text('Receitas por Categoria ${category.title}'),
      ),
    );
  }
}
