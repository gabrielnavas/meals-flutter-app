import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppBar(),
      body: const Center(
        child: Text('Navegar é preciso!!'),
      ),
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
