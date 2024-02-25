import 'package:flutter/material.dart';
import 'package:meals_flutter_app/screens/settings.dart';
import 'package:meals_flutter_app/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(
      {required this.settings, required this.onSettingsChanged, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(String title, String subtitle, bool value,
      void Function(bool?) onChanged) {
    Widget switchList = SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (valueSwitch) {
        onChanged(valueSwitch);
        widget.onSettingsChanged(settings);
      },
    );

    return switchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Configurações',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                  'Sem gluten',
                  'Só exibe refeições sem glúten!',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value!)),
              _createSwitch(
                  'Sem lactose',
                  'Só exibe refeições sem lactose!',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value!)),
              _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas!',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value!)),
              _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas!',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value!)),
            ],
          ))
        ],
      ),
    );
  }
}
