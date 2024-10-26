
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_list_with_bloc/model/movie_model.dart';

part 'favorites_list_event.dart';
part 'favorites_list_state.dart';

class FavoritesListBloc extends Bloc<FavoritesListEvent, FavoritesListState> {
  FavoritesListBloc() : super(FavoritesListInitial()) {
    on<FavoritesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
