import 'package:flutter/material.dart';
import 'package:task_4_movies_app/data/models/movie_data.dart';
import 'package:task_4_movies_app/data/models/movie_model.dart';

class MovieHelper extends ChangeNotifier {
  List<Movie> moviesList = [];

  void addMovie(Movie movie) {
    moviesList.add(movie);
    notifyListeners();
  }

  void removeMovie(int index) {
    moviesList.removeAt(index);
    notifyListeners();
  }

  void editMovie(Movie movie, int index) {
    moviesList.replaceRange(index, index + 1, [movie]);
  }
}