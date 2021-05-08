import 'package:flutter/material.dart';
import 'package:task_4_movies_app/data/models/movie_data.dart';
import 'package:task_4_movies_app/data/models/movie_helper_model.dart';
import 'package:task_4_movies_app/data/models/movie_model.dart';
import 'package:task_4_movies_app/data/repository/movie_helper.dart';
// screens
import 'package:task_4_movies_app/screens/details_screen.dart';
import 'package:task_4_movies_app/widgets/movie_item.dart';

import 'package:task_4_movies_app/widgets/add_new_widget.dart';
import 'package:task_4_movies_app/widgets/edit_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Movie> movieList = DUMMY_DATA;

void getRecentlyAdded() {
  List<Movie> mList = [];
  mList = DUMMY_DATA
      .where((element) => element.category == "RecentlyAdded")
      .toList();
  movieList = mList;
}

void getMyFavorites() {
  List<Movie> mList = [];
  mList =
      DUMMY_DATA.where((element) => element.category == "MyFavorites").toList();
  movieList = mList;
}

void reset() {
  movieList = DUMMY_DATA;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    getRecentlyAdded();
                  });
                },
                child: Text('Recently Added'),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  setState(() {
                    getMyFavorites();
                  });
                },
                child: Text('My Favorites'),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  setState(() {
                    reset();
                  });
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var movie = movieList[index];
          return Dismissible(
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                MovieDetailsScreen.routeName,
                arguments: movie,
              ),
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) => EditMovie(movie, index),
                );
              },
              child: MovieItem(
                imageUrl: movie.imageUrl,
                title: movie.name,
                releaseDate: movie.releaseDate.toString(),
                rating: movie.rating.toString(),
              ),
            ),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Are you sure?"),
                content: Text("Do you really want to delete this movie?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("NO"),
                  ),
                  TextButton(
                      onPressed: () {
                        MovieHelper().removeMovie(index);
                      },
                      child: Text("YES"))
                ],
              ),
            ),
          );
        },
        itemCount: movieList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
          showModalBottomSheet(
            context: context,
            builder: (ctx) => AddNewMovie(),
          ),
        child: Icon(Icons.add),
      ),
    );
  }
}