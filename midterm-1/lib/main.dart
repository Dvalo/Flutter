import 'package:flutter/material.dart';
import 'package:flutter_midterm/screens/add_new_screen.dart';
import 'package:flutter_midterm/screens/details_screen.dart';
import 'package:flutter_midterm/screens/edit_screen.dart';
import 'package:flutter_midterm/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Midterm Application',
      theme: ThemeData(
        accentColor: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)
          )
        )
      ),
      home: HomeScreen(),
      routes: {
        DetailsScreen.routeName: (ctx) => DetailsScreen(),
        EditScreen.routeName: (ctx) => EditScreen(),
        AddNewScreen.routeName: (ctx) => AddNewScreen()
      },
    );
  }
}