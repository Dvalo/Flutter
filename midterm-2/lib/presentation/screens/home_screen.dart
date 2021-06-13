import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/expense.dart';
import 'package:flutter_midterm/data/repositories/ExpensesHelper.dart';
import 'package:flutter_midterm/presentation/widgets/expense_list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  List<Expense> userExpenses;
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpensesHelper>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your expenses'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: expenseProvider.fetchExpensesAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new CircularProgressIndicator()
                  ],
                );
              } else {
                userExpenses = snapshot.data.docs
                    .map((doc) => Expense.fromMap(doc.data(), doc.id))
                    .toList();
                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (buildContext, index) =>
                      ExpenseListItem(expenseDetails: userExpenses[index]),
                  itemCount: userExpenses.length,
                );
              }
            }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/create-expense'),
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor
        ),
    );
  }
}