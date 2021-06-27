import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/data/models/todo.dart';
import 'package:flutter_final/data/repositories/ToDoHelper.dart';
import 'package:flutter_final/presentation/widgets/todo_list_item.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final String userId;
  MainScreen({Key key, @required this.userId}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> with TickerProviderStateMixin {
  List<ToDo> userToDos;
  bool animated = false;
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    final toDoProvider = Provider.of<ToDoHelper>(context);

    if (!animated) {
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          animated = true;
        });
        controller.forward();
      });
    }
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
                left: 30,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedDefaultTextStyle(
                    child: Text('TODO APP'),
                    style: animated
                        ? TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff747474),
                            fontSize: 30,
                          )
                        : TextStyle(
                            color: Color(0xff747474),
                            fontSize: 5,
                          ),
                    duration: Duration(milliseconds: 400),
                  ),
                  ElevatedButton(
                    // Add new Todo
                    onPressed: () {
                      final _formKey = GlobalKey<FormState>();
                      TextEditingController title = TextEditingController();
                      TextEditingController task = TextEditingController();
                      TextEditingController details = TextEditingController();
                      showModalBottomSheet(
                          backgroundColor: Color(0xff04A3A3),
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10, right: 20),
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
                                                fontWeight: FontWeight.bold),
                                            contentPadding:
                                                EdgeInsets.only(left: 10.0),
                                            filled: true,
                                            fillColor: Color(0xff04A3A3),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
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
                                                fontWeight: FontWeight.bold),
                                            contentPadding:
                                                EdgeInsets.only(left: 10.0),
                                            filled: true,
                                            fillColor: Color(0xff04A3A3),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
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
                                                fontWeight: FontWeight.bold),
                                            contentPadding:
                                                EdgeInsets.only(left: 10.0),
                                            filled: true,
                                            fillColor: Color(0xff04A3A3),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white, // background
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _formKey.currentState.save();
                                              await ToDoHelper().addToDo(ToDo(
                                                  title: title.text,
                                                  todoTask: task.text,
                                                  todoDescription: details.text,
                                                  completed: false,
                                                  createdBy: widget.userId));
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
                    child: Icon(Icons.add, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
            // Main display
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 50,
                ),
                width: double.infinity,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Color(0xff6cb4b1)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SlideTransition(
                    position: offset,
                    child: StreamBuilder(
                      stream: toDoProvider.fetchToDosAsStream(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [new CircularProgressIndicator()],
                          );
                        } else {
                          userToDos = snapshot.data.docs
                              .map((doc) => ToDo.fromMap(doc.data(), doc.id))
                              .where(
                                  (todo) => todo.createdBy == widget.userId)
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemBuilder: (buildContext, index) =>
                                ToDoListItem(toDoDetails: userToDos[index]),
                            itemCount: userToDos.length,
                          );
                        }
                      }
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
