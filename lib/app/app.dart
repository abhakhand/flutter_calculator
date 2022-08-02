import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/home/views/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Calculator',
      home: HomeView(),
    );
  }
}
