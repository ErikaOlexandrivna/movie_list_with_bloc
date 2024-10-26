part of 'movie_detail_bloc.dart';

enum LoadingStatus {
  initial,
  loading,
  failed,
  success,
}

class MovieDetailState extends Equatable {
  final MovieModel? movieDetail;
  final LoadingStatus loadingStatus;
  final List<TrailerModel>? trailers;
  final List<CreditsModel>? credits;
  final bool isFavorite;

  const MovieDetailState({
    this.movieDetail,
    this.loadingStatus = LoadingStatus.initial,
    this.trailers,
    this.credits,
    this.isFavorite = false,
  });

  MovieDetailState copyWith(
      {MovieModel? movieDetail,
      LoadingStatus? loadingStatus,
      List<TrailerModel>? trailers,
      bool? isFavorite,
      final List<CreditsModel>? credits}) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      trailers: trailers ?? this.trailers,
      credits: credits ?? this.credits,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        loadingStatus,
        credits,
        trailers,
        isFavorite,
      ];
}
