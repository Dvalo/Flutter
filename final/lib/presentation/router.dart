import 'package:flutter/material.dart';
import 'package:flutter_final/presentation/screens/login_screen.dart';
import 'package:flutter_final/presentation/screens/main_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => LoginScreen());
    } else if (settings.name == '/home') {
      Map args = settings.arguments;
      String userId = args['userId'];
      bool animated = args['animated'];
      return MaterialPageRoute(builder: (_) => MainScreen(userId: userId));
    } else {
      return null;
    }
  }
}
