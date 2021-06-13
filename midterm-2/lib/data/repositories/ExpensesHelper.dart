import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_midterm/data/models/expense.dart';
import 'package:flutter_midterm/data/services/Database.dart';

class ExpensesHelper extends ChangeNotifier {
  Database _database = Database('expenses');
  List<Expense> userExpenses;

  Stream<QuerySnapshot> fetchExpensesAsStream() {
    return _database.streamDataCollection();
  }

  // Should have been used for edit screen
  Future<Expense> getExpenseById(String id) async {
    var doc = await _database.getDocumentById(id);
    return Expense.fromMap(doc.data(), doc.id) ;
  }

  Future removeExpense(String id) async{
    await _database.removeDocument(id) ;
    return;
  }

  Future updateExpense(Expense data, String id) async {
    await _database.updateDocument(data.toJson(), id) ;
    return;
  }

  Future addExpense(Expense data) async {
    var result = await _database.addDocument(data.toJson()) ;
    return;
  }
}