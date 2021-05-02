import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String size;
  final double price;
  final String description;

  MainListItem({
    this.imageUrl,
    this.name,
    this.size,
    this.price,
    this.description
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: FadeInImage(
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/clothes_placeholder.png"),
                image: NetworkImage(imageUrl),
              ),
            ),
            Text(name),
            Text(price.toString()),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}