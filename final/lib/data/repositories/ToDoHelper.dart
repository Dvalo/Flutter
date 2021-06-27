import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_final/data/models/todo.dart';
import 'package:flutter_final/data/services/Database.dart';

class ToDoHelper extends ChangeNotifier {
  Database _database = Database('todos');
  List<ToDo> userToDos;

  Stream<QuerySnapshot> fetchToDosAsStream() {
    return _database.streamDataCollection();
  }

  Future<ToDo> getToDoById(String id) async {
    var doc = await _database.getDocumentById(id);
    return ToDo.fromMap(doc.data(), doc.id);
  }

  Future<bool> getToDoStatus(String id) async {
    var doc = await _database.getDocumentById(id);
    return ToDo.fromMap(doc.data(), doc.id).completed;
  }

  Future removeToDo(String id) async {
    await _database.removeDocument(id);
    return;
  }

  Future updateToDo(ToDo data, String id) async {
    await _database.updateDocument(data.toJson(), id);
    return;
  }

  Future addToDo(ToDo data) async {
    var result = await _database.addDocument(data.toJson());
    return;
  }
}
