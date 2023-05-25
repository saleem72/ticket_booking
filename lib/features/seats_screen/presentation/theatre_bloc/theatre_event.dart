// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theatre_bloc.dart';

abstract class TheatreEvent extends Equatable {
  const TheatreEvent();

  @override
  List<Object> get props => [];

  factory TheatreEvent.fetch() => _FetchData();
  factory TheatreEvent.seatWasTapped({required Seat seat}) =>
      _SeatWasTapped(seat: seat);
}

class _FetchData extends TheatreEvent {}

class _SeatWasTapped extends TheatreEvent {
  final Seat seat;
  const _SeatWasTapped({
    required this.seat,
  });

  @override
  List<Object> get props => [seat];
}
