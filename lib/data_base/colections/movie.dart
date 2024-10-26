import 'package:isar/isar.dart';
part 'movie.g.dart';

@Collection()
class Movie {
  Id id;
  String title;
  String posterPath;
  String overview;

  Movie({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.id,
  });
}
