import 'package:isar/isar.dart';

part 'movie.g.dart';

@Collection()
class Movie {
  Id? id;
  String? title;
  String? posterPath;
  String? overview;

  Movie({
    this.title,
    this.overview,
    this.posterPath,
    this.id,
  });
}
