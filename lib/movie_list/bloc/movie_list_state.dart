import 'package:equatable/equatable.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';

enum MovieStatus {initial, success, failure}

final class MovieListState extends Equatable {
  final MovieStatus status;
  final List<MovieModel> movies;

  const MovieListState ({
    this.status = MovieStatus.initial,
    this.movies = const <MovieModel>[],

});

  MovieListState copyWith({
    MovieStatus? status,
    List<MovieModel>? movies,
}) {
    return MovieListState (
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }

  @override

  List<Object?> get props => [status, movies];

  @override
  String toString() {
   return 'MovieListState {status: $status, movies: ${movies.length}';
  }
}