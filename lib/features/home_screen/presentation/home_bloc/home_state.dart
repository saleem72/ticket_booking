// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final MoviesResponse group;

  const HomeState({
    required this.group,
  });

  @override
  List<Object> get props => [group];

  factory HomeState.initial() => HomeState(
          group: MoviesResponse(
        playNow: [],
        comingSoon: [],
        topMovies: [],
      ));

  HomeState copyWith({
    MoviesResponse? group,
  }) {
    return HomeState(
      group: group ?? this.group,
    );
  }
}
