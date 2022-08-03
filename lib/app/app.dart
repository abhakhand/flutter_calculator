import 'package:flutter/material.dart';
import 'package:flutter_calculator/src/home/views/home_view.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return MaterialApp(
          title: 'Flutter Calculator',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            canvasColor: Colors.white,
            cardColor: Colors.grey.shade100,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.blue,
            backgroundColor: Colors.black,
            scaffoldBackgroundColor: Colors.black,
            canvasColor: Colors.black,
            cardColor: Colors.grey.shade900,
          ),
          home: const HomeView(),
        );
      },
    );
  }
}
