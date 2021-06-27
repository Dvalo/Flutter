import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/data/models/todo.dart';
import 'package:flutter_final/data/repositories/ToDoHelper.dart';

class ToDoListItem extends StatelessWidget {
  final ToDo toDoDetails;
  ToDoListItem({@required this.toDoDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
          backgroundColor: Color(0xff04A3A3),
          context: context,
          isScrollControlled: false,
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20, top: 10, bottom: 10, right: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Text(toDoDetails.title.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(toDoDetails.todoTask,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text(toDoDetails.todoDescription,
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        bool currentStatus =
                            await ToDoHelper().getToDoStatus(toDoDetails.id);
                        await ToDoHelper().updateToDo(
                            ToDo(
                                title: toDoDetails.title,
                                todoTask: toDoDetails.todoTask,
                                todoDescription: toDoDetails.todoDescription,
                                completed: !currentStatus,
                                createdBy: toDoDetails.createdBy),
                            toDoDetails.id);
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 80,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.done, color: Colors.white),
                              ),
                              Text("DONE",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        final _formKey = GlobalKey<FormState>();
                        TextEditingController title =
                            TextEditingController(text: toDoDetails.title);
                        TextEditingController task =
                            TextEditingController(text: toDoDetails.todoTask);
                        TextEditingController details = TextEditingController(
                            text: toDoDetails.todoDescription);
                        showModalBottomSheet(
                            backgroundColor: Color(0xff04A3A3),
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Form(
                                key: _formKey,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                      bottom: 10,
                                      right: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            top: 10,
                                            bottom: 10,
                                            right: 10),
                                        child: Card(
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                            decoration: InputDecoration(
                                              hintText: "Please Enter Title",
                                              hintStyle: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold),
                                              contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                              filled: true,
                                              fillColor: Color(0xff04A3A3),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            controller: title,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter valid amount';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            top: 10,
                                            bottom: 10,
                                            right: 10),
                                        child: Card(
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                            decoration: InputDecoration(
                                              hintText: "Please Enter Task",
                                              hintStyle: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold),
                                              contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                              filled: true,
                                              fillColor: Color(0xff04A3A3),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            controller: task,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter valid amount';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            top: 10,
                                            bottom: 10,
                                            right: 10),
                                        child: Card(
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Please Enter Task Details",
                                              hintStyle: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold),
                                              contentPadding:
                                                  EdgeInsets.only(left: 10.0),
                                              filled: true,
                                              fillColor: Color(0xff04A3A3),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            controller: details,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter valid amount';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary:
                                                  Colors.white, // background
                                            ),
                                            onPressed: () async {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();
                                                await ToDoHelper().updateToDo(
                                                    ToDo(
                                                        title: title.text,
                                                        todoTask: task.text,
                                                        todoDescription:
                                                            details.text,
                                                        completed: toDoDetails
                                                            .completed,
                                                        createdBy: toDoDetails
                                                            .createdBy),
                                                    toDoDetails.id);
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Text(
                                              "SUBMIT",
                                              style: TextStyle(
                                                  color: Color(0xff04A3A3)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                          width: 80,
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.edit, color: Colors.white),
                              ),
                              Text("EDIT",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text('You are about to delete ' +
                                      toDoDetails.title),
                                  content: Text(
                                      'Are you sure you want to do this?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("NO"),
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          await ToDoHelper()
                                              .removeToDo(toDoDetails.id);
                                          Navigator.pop(context);
                                        },
                                        child: Text("YES"))
                                  ],
                                ));
                      },
                      child: Container(
                          width: 80,
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child:
                                    Icon(Icons.delete, color: Colors.white),
                              ),
                              Text("DELETE",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ],
                          )),
                    ),
                  ],
                )
              ],
            );
          }
        );
      },
      child: Card(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Container(
          height: 80,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, left: 10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(toDoDetails.title.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black)),
                        Text(toDoDetails.todoTask,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black)),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        bool currentStatus =
                            await ToDoHelper().getToDoStatus(toDoDetails.id);
                        await ToDoHelper().updateToDo(
                            ToDo(
                                title: toDoDetails.title,
                                todoTask: toDoDetails.todoTask,
                                todoDescription: toDoDetails.todoDescription,
                                completed: !currentStatus,
                                createdBy: toDoDetails.createdBy),
                            toDoDetails.id);
                      },
                      child: Icon(Icons.done, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                        primary: toDoDetails.completed
                            ? Color(0xff0ecc57)
                            : Color(0xff747474),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
