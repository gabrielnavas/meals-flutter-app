import 'package:flutter/material.dart';
import 'package:meals_flutter_app/data/dummy_data.dart';
import 'package:meals_flutter_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children =
        dummyCategories.map((e) => CategoryItem(e)).toList();

    Widget body = GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // tamanho máximo no cross axis
        childAspectRatio: 3 / 2, // proporção na largura e altura
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: children,
    );

    return Scaffold(
      appBar: _renderAppBar(),
      body: body,
    );
  }

  AppBar _renderAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Center(
        child: Text(
          'Delicia do Gabs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
