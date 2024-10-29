
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_list_with_bloc/data_sorce/colections/movie.dart';
import 'package:movie_list_with_bloc/data_sorce/data_base_service/movie_data_base.dart';

part 'favorites_list_event.dart';
part 'favorites_list_state.dart';

class FavoritesListBloc extends Bloc<FavoritesListEvent, FavoritesListState> {
  final MovieDataBase _movieDataBase =MovieDataBase.instance;
  FavoritesListBloc() : super(FavoritesListInitial()) {
    on<FetchFavoritesList>(_onFetchFavoritesList);
  }

  Future<void> _onFetchFavoritesList(FetchFavoritesList event, Emitter<FavoritesListState> emit) async {
    try {
      final newFavoritesList = await _movieDataBase.fetchMovieList();
      emit(FavoritesLoadedSuccess(newFavoritesList));
    } catch (error) {
      emit(FavoritesListFailed(errorMessage: error.toString()));
    }
  }
}
