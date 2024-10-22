import 'dart:convert';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';
import 'package:movie_list_with_bloc/movie_list/bloc/movie_list_event.dart';
import 'package:movie_list_with_bloc/movie_list/bloc/movie_list_state.dart';
import 'package:stream_transform/stream_transform.dart';


const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(const MovieListState()) {
    on<MovieListFetched>(_onMovieFetched, transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onMovieFetched(MovieListFetched event, Emitter<MovieListState> emit) async {
    try {
      if (state.status == MovieStatus.initial) {
        final movies = await _fetchMovies();
        emit(
          state.copyWith(
            status: MovieStatus.success,
            movies: movies,
          ),
        );
        return;
      }
      if (state.status == MovieStatus.success) {
        final nextPage = state.movies.length ~/ 20 + 1;
        final movies = await _fetchMovies(nextPage);
        emit(state.copyWith(movies: List.of(state.movies)..addAll(movies)));
      }
    } catch (error) {
      emit(
        state.copyWith(status: MovieStatus.failure),
      );
    }
  }

  Future<List<MovieModel>> _fetchMovies([int page = 1]) async {
    Response response = await http
        .get(Uri.https('api.themoviedb.org', '/3/discover/movie', {'page': '$page'}),
        headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOGMxYTYwMjFlMjdkZjNlZmRkZGRjODU1NTRlMjFiNyIsIm5iZiI6MTcyNzc5NTk3Ni4yNzM4ODMsInN1YiI6IjY0YmY4MmZhMDE3NTdmMDBlMjE2YTYxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LiUBJhN9WXWNp4fEtwwh-esCzBVuVPZq1sJARtMgUcM',
    });

    if (response.statusCode == 200) {
      print(response.statusCode);
      final data = json.decode(response.body);
      print(response.request);
      return List<MovieModel>.from(data['results'].map((item) => MovieModel.fromJson(item)));
    } else {
      throw Exception('error fetching movies');
    }
  }
}
