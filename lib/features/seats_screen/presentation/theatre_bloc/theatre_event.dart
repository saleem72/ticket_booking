part of 'theatre_bloc.dart';

abstract class TheatreEvent extends Equatable {
  const TheatreEvent();

  @override
  List<Object> get props => [];

  factory TheatreEvent.fetch() => _FetchData();
}

class _FetchData extends TheatreEvent {}
