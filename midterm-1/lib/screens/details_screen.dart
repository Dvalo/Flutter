import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/clothes_model.dart';
import 'package:flutter_midterm/data/repository/clothes_helper.dart';
import 'package:flutter_midterm/screens/home_screen.dart';


class DetailsScreen extends StatefulWidget {
  static const routeName = "/details-screen";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final Clothes clothing = ModalRoute.of(context).settings.arguments as Clothes;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),

            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('You are about to delete ' + clothing.name),
                  content: Text('Are you sure you want to do this?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("NO"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          ClothesRepository().removeClothing(clothing.id);
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        });
                      },
                      child: Text("YES"))
                  ],
                )
              );
            }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              children: [
                Image.network(
                  clothing.imageUrl,
                  height: 400.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        textAlign: TextAlign.left
                      ),
                      Text(
                        clothing.name,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Price",
                          textAlign: TextAlign.left
                      ),
                      Text(
                          clothing.price.toString(),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Size",
                          textAlign: TextAlign.left
                      ),
                      Text(
                          clothing.size,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
                Text(clothing.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
