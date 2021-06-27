import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/app-logo.png",
                      scale: 2.0,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Card(
                    child: TextFormField(
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black),
                        contentPadding: EdgeInsets.only(left: 10.0),
                        filled: true,
                        fillColor: Color(0xff04A3A3),
                      ),
                      controller: userId,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid ID';
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
                      onPressed: () => Navigator.pushNamed(context, '/home',
                          arguments: {'userId': userId.text, 'animated': true}),
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
