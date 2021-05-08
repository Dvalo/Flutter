import 'package:task_4_movies_app/data/models/movie_data.dart';
import 'package:task_4_movies_app/data/models/movie_model.dart';

class MovieRepository {
  void addMovie(Movie movie) {
    DUMMY_DATA.add(movie);
  }

  void removeMovie(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editMovie(Movie movie, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [movie]);
  }
}