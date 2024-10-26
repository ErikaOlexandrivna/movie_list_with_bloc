import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list_with_bloc/favoritees-list/favorites_list_bloc.dart';
import 'package:movie_list_with_bloc/favoritees-list/view/favorites_list_view.dart';

class FavoritesListPage extends StatelessWidget {
  const FavoritesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_) => FavoritesListBloc()..add(FetchFavoritesList()),
        child: const FavoritesListView(),
      ),
    );
  }
}
