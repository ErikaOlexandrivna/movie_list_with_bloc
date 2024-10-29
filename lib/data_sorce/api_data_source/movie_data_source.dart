import 'dart:convert';

import 'package:movie_list_with_bloc/model/credits_model.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_list_with_bloc/model/treirel_model.dart';

class MovieDataSource {

  Future<MovieModel> fetchMovieDetailed(int movieId) async {
    final response = await http.post(Uri.https('api.themoviedb.org', '3/movie/$movieId'), headers: {
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

  Future<List<TrailerModel>> fetchTrailers(int movieId) async {
    final response =
    await http.get(Uri.https('api.themoviedb.org', '3/movie/$movieId/videos'), headers: {
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

  Future<List<CreditsModel>> fetchCredits(int movieId) async {
    final response =
    await http.get(Uri.https('api.themoviedb.org', '3/movie/$movieId/credits'), headers: {
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