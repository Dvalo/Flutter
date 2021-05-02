import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/clothes_model.dart';
import 'package:flutter_midterm/data/repository/clothes_helper.dart';
import 'package:flutter_midterm/screens/home_screen.dart';

class AddNewScreen extends StatelessWidget {
  static const routeName = "/add-new";
  final _formKey = GlobalKey<FormState>();

  TextEditingController clothingID = TextEditingController();
  TextEditingController clothingName = TextEditingController();
  TextEditingController clothingURL = TextEditingController();
  TextEditingController clothingSize = TextEditingController();
  TextEditingController clothingPrice = TextEditingController();
  TextEditingController clothingDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Item'),
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
                      decoration: InputDecoration(hintText: "Please Enter ID", contentPadding: EdgeInsets.only(left: 10.0),),
                      controller: clothingID,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid text';
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
                      decoration: InputDecoration(hintText: "Please Enter Name", contentPadding: EdgeInsets.only(left: 10.0),),
                      controller: clothingName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid text';
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
                      decoration: InputDecoration(hintText: "Please Enter Image URL", contentPadding: EdgeInsets.only(left: 10.0),),
                      controller: clothingURL,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid URL';
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
                      decoration: InputDecoration(hintText: "Please Enter Size", contentPadding: EdgeInsets.only(left: 10.0),),
                      controller: clothingSize,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid value';
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
                      decoration: InputDecoration(hintText: "Please Enter Price", contentPadding: EdgeInsets.only(left: 10.0),),
                      controller: clothingPrice,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid value';
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
                      decoration: InputDecoration(hintText: "Please Enter Description", contentPadding: EdgeInsets.only(left: 10.0),),
                      controller: clothingDescription,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid text';
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
                        primary: Colors.blue, // background
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text("BACK"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // background
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Clothes clothing = Clothes(
                            id: int.parse(clothingID.text),
                            name: clothingName.text,
                            imageUrl: clothingURL.text,
                            size: clothingSize.text,
                            price: double.parse(clothingPrice.text),
                            description: clothingDescription.text,
                          );
                          ClothesRepository().addClothing(clothing);
                          Navigator.pushNamed(context, HomeScreen.routeName);
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
