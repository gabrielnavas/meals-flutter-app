import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/meal.dart';
import 'package:meals_flutter_app/models/tab_screen.dart';
import 'package:meals_flutter_app/screens/categories_screen.dart';
import 'package:meals_flutter_app/screens/favorite_screen.dart';
import 'package:meals_flutter_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  TabsScreen({required this.favoriteMeals, super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Meal> favoriteMeals = [];
  List<TabScreen> _screens = [];

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    super.initState();
    _screens = [
      const TabScreen(
        title: 'Lista de categorias',
        screen: CategoriesScreen(),
      ),
      TabScreen(
        title: 'Meus favoritos',
        screen: FavoriteScreen(widget.favoriteMeals),
      ),
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          _screens[_selectedScreenIndex].title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: const Color.fromARGB(191, 255, 255, 141),
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        backgroundColor: Colors.redAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
