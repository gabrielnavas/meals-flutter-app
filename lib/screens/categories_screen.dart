import 'package:flutter/material.dart';
import 'package:meals_flutter_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = dummyCategories
        .map(
          (e) => Container(
            child: Text(e.title),
            alignment: Alignment.center,
            color: e.color,
          ),
        )
        .toList();
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // tamanho máximo no cross axis
        childAspectRatio: 3 / 2, // proporção na largura e altura
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: children,
    );
  }
}
