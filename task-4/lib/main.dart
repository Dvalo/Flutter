import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_4_movies_app/data/models/movie_helper_model.dart';

import 'package:task_4_movies_app/screens/home_screen.dart';
import 'package:task_4_movies_app/screens/details_screen.dart';
import 'package:task_4_movies_app/widgets/add_new_widget.dart';
import 'package:task_4_movies_app/widgets/edit_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MovieHelper(),
      child: MaterialApp(
        title: 'Flutter Task 4',
        theme: ThemeData(
            accentColor: Colors.blueAccent,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent)
                )
            )
        ),
        home: HomeScreen(),
      ),
    );
  }
}