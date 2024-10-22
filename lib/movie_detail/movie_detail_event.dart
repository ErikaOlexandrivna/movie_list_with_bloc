part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class MovieDetailedLoaded extends MovieDetailEvent {
  final int movieId;

  const MovieDetailedLoaded(this.movieId);

  @override
  List<Object?> get props => [movieId];

}
