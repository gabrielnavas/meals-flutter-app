import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.accents[14],
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Vamos cozinhar',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.redAccent,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _createItem(Icons.restaurant, "Refeições"),
          _createItem(Icons.settings, "Configurações")
        ],
      ),
    );
  }
}
