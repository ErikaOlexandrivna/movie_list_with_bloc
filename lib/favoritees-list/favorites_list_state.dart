part of 'favorites_list_bloc.dart';

sealed class FavoritesListState extends Equatable {
  const FavoritesListState();
  @override
  List<Object> get props => [];
}

final class FavoritesListInitial extends FavoritesListState {
}

final class FavoritesListLoading extends FavoritesListState {}

final class FavoritesListFailed extends FavoritesListState{
  final String errorMessage;

  const FavoritesListFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class FavoritesLoadedSuccess extends FavoritesListState {
  final List<Movie> favoritesList;

  const FavoritesLoadedSuccess(this.favoritesList);

  @override
  List<Object> get props => [favoritesList];
}

