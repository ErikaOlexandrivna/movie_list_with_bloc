part of 'favorites_list_bloc.dart';

sealed class FavoritesListState extends Equatable {
  const FavoritesListState();
  @override
  List<Object> get props => [];
}

final class FavoritesListInitial extends FavoritesListState {
}

final class FavoritesListLoading extends FavoritesListState {}

final class FavoritesListFailed extends FavoritesListState{}

final class FavoritesLoadedSuccess extends FavoritesListState {
  final List<MovieModel> favoritesList;

  const FavoritesLoadedSuccess(this.favoritesList);

  @override
  List<Object> get props => [favoritesList];
}

