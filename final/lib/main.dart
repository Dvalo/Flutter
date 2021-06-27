import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/ToDoHelper.dart';
import 'package:flutter_final/presentation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ToDoHelper(),
      child: MaterialApp(
        title: 'To Do App',
        theme: new ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Color(0xff04A3A3),
            accentColor: Colors.cyan[600],
            fontFamily: 'Roboto',
            textTheme: TextTheme(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(),
            ).apply(
              displayColor: Colors.blue,
            )),
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
