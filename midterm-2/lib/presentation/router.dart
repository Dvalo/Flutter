import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/expense.dart';
import 'package:flutter_midterm/presentation/screens/add_expense_screen.dart';
import 'package:flutter_midterm/presentation/screens/edit_expense_screen.dart';
import 'package:flutter_midterm/presentation/screens/home_screen.dart';
import 'package:flutter_midterm/presentation/screens/login_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
          builder: (_) => LoginScreen()
      );
    } else if (settings.name == '/home') {
      return MaterialPageRoute(
          builder: (_) => HomeScreen()
      );
    } else if (settings.name == '/create-expense') {
      return MaterialPageRoute(
          builder: (_) => AddExpenseScreen()
      );
    } else if (settings.name == '/edit-expense') {
      Expense expense = settings.arguments as Expense;
      return MaterialPageRoute(
        builder: (_) => EditExpenseScreen(userExpense: expense)
      );
    } else {
      return null;
    }
  }
}