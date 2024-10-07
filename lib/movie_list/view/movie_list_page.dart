import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list_with_bloc/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_list_with_bloc/movie_list/bloc/movie_list_event.dart';

import 'movie_list.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Top Film',
          ),
        ),
        body: BlocProvider(
          create: (_) => MovieListBloc()..add(MovieListFetched()),
          child: const MovieList(),
        ));
  }
}
