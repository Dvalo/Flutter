import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api_example/logic/cubits/todo_data/todo_data_cubit.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'create_todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key, required this.userID}) : super(key: key);
  final String userID;

  Future<http.Response> deleteToDo(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<TodoDataCubit, TodoDataState>(
        listener: (context, state) {
          if (state is TodoDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is TodoDataInitial) {
            BlocProvider.of<TodoDataCubit>(context)
                .getTodoData(userID.toString());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var todo = state.todoList[index];
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    deleteToDo(todo.id.toString());
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    title: Text('${todo.title!}'),
                    trailing: Icon(todo.completed! ? Icons.done : Icons.close),
                  ),
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                );
              },
            );
          } else {
            return Center(
              child: Text('Ops! Something went wrong!'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateToDoItem()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
