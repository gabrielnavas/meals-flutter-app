import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category.title),
      alignment: Alignment.center,
      color: category.color,
    );
  }
}
