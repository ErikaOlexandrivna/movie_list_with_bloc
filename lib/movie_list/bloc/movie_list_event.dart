import 'package:equatable/equatable.dart';

sealed class MovieListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MovieListFetched extends MovieListEvent{}