import 'package:isar/isar.dart';
import 'package:movie_list_with_bloc/data_sorce/colections/movie.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';
import 'package:path_provider/path_provider.dart';

class MovieDataBase {
  MovieDataBase._internal();

  static final MovieDataBase _singleton = MovieDataBase._internal();

  static MovieDataBase get instance => _singleton;

  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MovieSchema],
      directory: dir.path,
    );
  }

  //============= add movie =============

  Future<void> addMovie(MovieModel movie) async {
    final newMovie = Movie()
      ..id = movie.id
      ..title = movie.title
      ..posterPath = movie.posterPath
      ..overview = movie.overview;

    await isar.writeTxn(() => isar.movies.put(newMovie));
  }

  Future<List<Movie>> fetchMovieList() async {
    List<Movie> favoritedList = await isar.movies.where().findAll();
    return favoritedList;
  }

  Future<bool> isMovieFavorited(int id) async {
    final movie = await isar.movies.where().idEqualTo(id).findFirst();
    return movie != null;
  }
}
