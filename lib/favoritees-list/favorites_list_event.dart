part of 'favorites_list_bloc.dart';

sealed class FavoritesListEvent extends Equatable {
  const FavoritesListEvent();
}

final class FetchFavoritesList extends FavoritesListEvent {
  @override
  List<Object?> get props => [];
}
