import 'package:flutter/material.dart';
import 'package:flutter_task_6/data/models/country.dart';
import 'package:flutter_task_6/presentation/screens/details_screen.dart';
import 'package:flutter_task_6/presentation/screens/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else if (settings.name == '/country-details') {
      Country country = settings.arguments as Country;
      return MaterialPageRoute(builder: (_) => DetailsScreen(country: country));
    } else {
      return null;
    }
  }
}