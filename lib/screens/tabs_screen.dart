import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/TabScreen.dart';
import 'package:meals_flutter_app/screens/categories_screen.dart';
import 'package:meals_flutter_app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 1;
  final List<TabScreen> _screens = [
    const TabScreen(
      title: 'Lista de categorias',
      screen: CategoriesScreen(),
    ),
    const TabScreen(
      title: 'Meus favoritos',
      screen: FavoriteScreen(),
    ),
  ];

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
        ),
      ),
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
