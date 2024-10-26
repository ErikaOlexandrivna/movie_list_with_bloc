import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list_with_bloc/const.dart';
import 'package:movie_list_with_bloc/favoritees-list/favorites_list_bloc.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesListBloc, FavoritesListState>(builder: (context, state) {
      if (state is FavoritesListLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FavoritesLoadedSuccess) {
        return ListView.builder(
            itemCount: state.favoritesList.length,
            itemBuilder: (context, index) {
              final movie = state.favoritesList[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Row(
                  children: [
                    Flexible(child: Image.network(posterPath + movie.posterPath)),
                    const SizedBox(width: 10),
                    Flexible(child: Column(
                      children: [
                        Text(movie.title),
                        Text('Reating: ${movie.voteAverage}')
                      ],
                    ))
                  ],
                ),
              );
            });
      } else if (state is FavoritesListFailed) {
        return const Center(child: Text("Oops! Щось пішло не так"),);
      } else {
        return const Center(child: Text("Oops! Зовсім все пішло не так"),);
      }
    });
  }
}
