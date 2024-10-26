import 'package:isar/isar.dart';
import 'package:movie_list_with_bloc/data_base/colections/movie.dart';
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
}
