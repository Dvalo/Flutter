import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/expense.dart';
import 'package:flutter_midterm/data/repositories/ExpensesHelper.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expenseDetails;

  ExpenseListItem({@required this.expenseDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/edit-expense', arguments: expenseDetails);
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('You are about to delete ' + expenseDetails.title),
              content: Text('Are you sure you want to do this?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("NO"),
                ),
                TextButton(
                    onPressed: () async {
                      await ExpensesHelper().removeExpense(expenseDetails.id);
                      Navigator.pop(context);
                    },
                    child: Text("YES"))
              ],
            )
        );
      },
      child: Card(
        child: Container(
          height: 80,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          color: Color(0xff1c2754),
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, left: 10),
                child: Column(
                  children: [
                    Text(
                        "-" + expenseDetails.expenseAmount,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xffe66767))
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0),
                child: Column(
                  children: [
                    Text(expenseDetails.title),
                    Text(expenseDetails.description),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}