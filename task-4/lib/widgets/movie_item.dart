import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String releaseDate;
  final String rating;

  MovieItem({
    this.imageUrl,
    this.title,
    this.releaseDate,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/image_placeholder.jpg"),
                image: NetworkImage(imageUrl),
              ),
            ),
            Text(title),
            Text(releaseDate),
          ],
        ),
      ),
    );
  }
}