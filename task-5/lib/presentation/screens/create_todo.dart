import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_example/data/models/todo.dart';
import 'package:http/http.dart' as http;

class CreateToDoItem extends StatelessWidget {
  static const routeName = "/new-todo";

  Future<Todo> createToDo(String title, String completed) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'completed': completed, // This is not working, I tried :(
      }),
    );
    if (response.statusCode == 201) {
      return Todo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unable to create new to-do Item :(');
    }
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController toDoTitle = TextEditingController();
  TextEditingController toDoState = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: toDoTitle,
                    decoration: InputDecoration(hintText: "Please enter Title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid Title";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: toDoState,
                    decoration: InputDecoration(hintText: "Please enter state of todo item"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid state";
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          createToDo(toDoTitle.text, toDoState.text);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Create"),
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