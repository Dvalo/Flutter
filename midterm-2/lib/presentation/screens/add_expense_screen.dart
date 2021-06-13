import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/expense.dart';
import 'package:flutter_midterm/data/repositories/ExpensesHelper.dart';

class AddExpenseScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController expenseAmt = TextEditingController();
  TextEditingController expenseTitle = TextEditingController();
  TextEditingController expenseDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Expense'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding (
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Card(
                    child: TextFormField(
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Please Enter Amount",
                        hintStyle: TextStyle(fontSize: 14.0, color: Colors.redAccent),
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      controller: expenseAmt,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid amount';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding (
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Card(
                    child: TextFormField(
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Please Enter Title",
                        hintStyle: TextStyle(fontSize: 14.0, color: Colors.redAccent),
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      controller: expenseTitle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid Title';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding (
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Card(
                    child: TextFormField(
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Please Enter Description",
                        hintStyle: TextStyle(fontSize: 14.0, color: Colors.redAccent),
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      controller: expenseDescription,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid Description';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor, // background
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text("BACK"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor, // background
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          await ExpensesHelper().addExpense(Expense(title: expenseTitle.text, expenseAmount: expenseAmt.text, description: expenseDescription.text));
                          Navigator.pop(context);
                        }
                      },
                      child: Text("ADD"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}