// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];

  factory HomeEvent.fetchMovies() => _FetchMovies();
  factory HomeEvent.updateMovies({
    required MoviesResponse response,
  }) =>
      _UpdateMovies(response: response);
}

class _FetchMovies extends HomeEvent {}

class _UpdateMovies extends HomeEvent {
  final MoviesResponse response;

  const _UpdateMovies({
    required this.response,
  });

  @override
  List<Object> get props => [response];
}
