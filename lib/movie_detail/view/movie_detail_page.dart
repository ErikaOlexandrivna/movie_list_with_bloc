import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list_with_bloc/movie_detail/movie_detail_bloc.dart';

import 'movie_detail_view.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (_) => MovieDetailBloc()..add(MovieDetailedLoaded(movieId)),
      child: const MovieDetailView(),
    ));
  }
}
