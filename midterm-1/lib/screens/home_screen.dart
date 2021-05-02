import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/clothes_model.dart';
import 'package:flutter_midterm/data/models/dummy_data.dart';
import 'package:flutter_midterm/screens/add_new_screen.dart';
import 'package:flutter_midterm/screens/details_screen.dart';
import 'package:flutter_midterm/screens/edit_screen.dart';
import 'package:flutter_midterm/widgets/main_list_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Clothes> clothesList = DUMMY_DATA;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Clothing Store'),
      ),
      body: GridView.builder(itemBuilder: (ctx, index) {
        var clothing = clothesList[index];

        return Container(

          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DetailsScreen.routeName,
              arguments: clothing
            ),
            onLongPress: () {
              Navigator.pushNamed(
                context,
                EditScreen.routeName,
                arguments: {"clothing": clothing, "index": index},
              ).then((_) {
                setState(() {});
              });
            },
            child: MainListItem(
                name: clothing.name,
                imageUrl: clothing.imageUrl,
                size: clothing.size,
                price: clothing.price,
                description: clothing.description
            ),
          ),
        );
      },
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 0.9,
          crossAxisSpacing: 0,
          mainAxisSpacing: 20
      ),

      itemCount: clothesList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AddNewScreen.routeName),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
