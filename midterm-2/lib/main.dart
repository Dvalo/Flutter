import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_midterm/presentation/router.dart';

import 'data/repositories/ExpensesHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ExpensesHelper(),
      child: MaterialApp(
        title: 'Expenses App',
        theme: new ThemeData(
            scaffoldBackgroundColor: const Color(0xDD141c3b),
            primaryColor: Color(0xff1c2754),
            accentColor: Colors.cyan[600],
            textTheme: TextTheme(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(),
            ).apply(
              bodyColor: Colors.amber[200],
              displayColor: Colors.blue,
            )
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}