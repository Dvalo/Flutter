import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/expense.dart';
import 'package:flutter_midterm/data/repositories/ExpensesHelper.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
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
                        hintText: "Please Enter User ID",
                        hintStyle: TextStyle(fontSize: 14.0, color: Colors.cyanAccent),
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      controller: userId,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid amount';
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
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                      child: Text("LOGIN"),
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