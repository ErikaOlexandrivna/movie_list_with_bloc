import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_list_with_bloc/model/credits_model.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';
import 'package:movie_list_with_bloc/model/treirel_model.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(const MovieDetailState()) {
    on<MovieDetailedLoaded>(_onMovieDetailLoad);
  }

  Future<void> _onMovieDetailLoad(
      MovieDetailedLoaded event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    try {
      final movieDetail = await fetchMovieDetailed(event.movieId);
      final trailers = await _fetchTrailers(event.movieId);
      final credits = await _fetchCredits(event.movieId);
      emit(state.copyWith(
        movieDetail: movieDetail,
        loadingStatus: LoadingStatus.success,
        trailers: trailers,
        credits: credits,
      ));
    } catch (error) {
      print("Error occurred: $error");
      emit(state.copyWith(loadingStatus: LoadingStatus.failed));
    }
  }

  Future<MovieModel> fetchMovieDetailed(int movieId) async {
    final response = await http
        .get(Uri.https('api.themoviedb.org', '3/movie/$movieId'), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOGMxYTYwMjFlMjdkZjNlZmRkZGRjODU1NTRlMjFiNyIsIm5iZiI6MTcyNzc5NTk3Ni4yNzM4ODMsInN1YiI6IjY0YmY4MmZhMDE3NTdmMDBlMjE2YTYxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LiUBJhN9WXWNp4fEtwwh-esCzBVuVPZq1sJARtMgUcM',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MovieModel.fromJson(data);
    } else {
      throw Exception('Sorry! Fetching detail movie Failed!');
    }
  }

  Future<List<TrailerModel>> _fetchTrailers(int movieId) async {
    final response = await http.get(
        Uri.https('api.themoviedb.org', '3/movie/$movieId/videos'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOGMxYTYwMjFlMjdkZjNlZmRkZGRjODU1NTRlMjFiNyIsIm5iZiI6MTcyNzc5NTk3Ni4yNzM4ODMsInN1YiI6IjY0YmY4MmZhMDE3NTdmMDBlMjE2YTYxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LiUBJhN9WXWNp4fEtwwh-esCzBVuVPZq1sJARtMgUcM',
        });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<TrailerModel> trailers = [];
      for (var item in data['results']) {
        trailers.add(TrailerModel.fromJson(item));
      }
      return trailers;
    } else {
      throw Exception('Sorry! Fetching detail movie Failed!');
    }
  }

  Future<List<CreditsModel>> _fetchCredits(int movieId) async {
    final response = await http.get(
        Uri.https('api.themoviedb.org', '3/movie/$movieId/credits'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOGMxYTYwMjFlMjdkZjNlZmRkZGRjODU1NTRlMjFiNyIsIm5iZiI6MTcyNzc5NTk3Ni4yNzM4ODMsInN1YiI6IjY0YmY4MmZhMDE3NTdmMDBlMjE2YTYxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LiUBJhN9WXWNp4fEtwwh-esCzBVuVPZq1sJARtMgUcM',
        });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<CreditsModel> credits = [];
      for (var item in data['cast']) {
        credits.add(CreditsModel.fromJson(item));
      }
      return credits;
    } else {
      throw Exception('Failed to load credits');
    }
  }
}
