import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list_with_bloc/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_list_with_bloc/movie_list/bloc/movie_list_event.dart';
import 'package:movie_list_with_bloc/movie_list/bloc/movie_list_state.dart';
import 'package:movie_list_with_bloc/movie_list/view/widgets/movie_item.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) context.read<MovieListBloc>().add(MovieListFetched());
  }

  bool get _isBottom {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc, MovieListState>(builder: (context, state) {
      if (state.status == MovieStatus.failure) {
        return const Center(
          child: Text('Помилка, дані не отримано'),
        );
      }
      if (state.status == MovieStatus.success) {
        if (state.movies.isEmpty) {
          return const Center(
            child: Text('Список пустий'),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            controller: _scrollController,
              itemCount: state.movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 263,
              ),
              itemBuilder: (context, index) {
                return MovieItem(movie: state.movies[index]);
              }),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
