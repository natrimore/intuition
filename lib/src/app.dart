import 'package:flutter/material.dart';
import 'package:intuition/src/presentation/router/home_page.dart';
import 'package:intuition/src/presentation/screens/home_screen/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
