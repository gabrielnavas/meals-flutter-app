import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

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
