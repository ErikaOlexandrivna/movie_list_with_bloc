import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:movie_list_with_bloc/data_sorce/api_data_source/movie_data_source.dart';
import 'package:movie_list_with_bloc/data_sorce/colections/movie.dart';
import 'package:movie_list_with_bloc/data_sorce/data_base_service/movie_data_base.dart';
import 'package:movie_list_with_bloc/model/credits_model.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';
import 'package:movie_list_with_bloc/model/treirel_model.dart';

import '../model/review_model.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieDataBase _movieDataBase = MovieDataBase.instance;
  final MovieDataSource _movieDataSource = MovieDataSource();

  MovieDetailBloc() : super(const MovieDetailState()) {
    on<MovieDetailedLoaded>(_onMovieDetailLoad);
    on<MovieToggleFavorites>(_onMovieToggleFavorites);
  }

  Future<void> _onMovieDetailLoad(
      MovieDetailedLoaded event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    try {
      final movieDetail =
          await _movieDataSource.fetchMovieDetailed(event.movieId);
      final isFavorited = await _movieDataBase.isMovieFavorited(event.movieId);
      final trailers = await _movieDataSource.fetchTrailers(event.movieId);
      final credits = await _movieDataSource.fetchCredits(event.movieId);
      final reviews = await _movieDataSource.fetchReviews(event.movieId);
      emit(state.copyWith(
        movieDetail: movieDetail,
        loadingStatus: LoadingStatus.success,
        trailers: trailers,
        credits: credits,
        isFavorite: isFavorited,
        reviews:reviews,
      ));
    } catch (error) {
      print("Error occurred: $error");
      emit(state.copyWith(loadingStatus: LoadingStatus.failed,
      ));
    }
  }

  Future<void> _onMovieToggleFavorites(
      MovieToggleFavorites event, Emitter<MovieDetailState> emmit) async {
    final MovieModel movie = state.movieDetail!;

    final isCurrentlyFavorited = state.isFavorite;

    if (isCurrentlyFavorited) {
      await _movieDataBase.isar.writeTxn(() async {
        final existingMovie = await _movieDataBase.isar.movies
            .where()
            .idEqualTo(movie.id)
            .findFirst();
        if (existingMovie != null) {
          await _movieDataBase.isar.movies.delete(existingMovie.id!);
        }
      });
      emit(state.copyWith(isFavorite: false));
    } else {
      await _movieDataBase.addMovie(movie);
      emit(state.copyWith(isFavorite: true));
    }
  }
}
