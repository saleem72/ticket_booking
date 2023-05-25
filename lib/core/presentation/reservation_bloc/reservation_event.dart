// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reservation_bloc.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];

  factory ReservationEvent.setDay({required DateTime date}) =>
      _ReservationSetDay(date: date);
  factory ReservationEvent.setTime({required int hour, required int minutes}) =>
      _ReservationSetTime(hour: hour, minutes: minutes);
}

class _ReservationSetDay extends ReservationEvent {
  final DateTime date;
  const _ReservationSetDay({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}

class _ReservationSetTime extends ReservationEvent {
  final int hour;
  final int minutes;
  const _ReservationSetTime({
    required this.hour,
    required this.minutes,
  });

  @override
  List<Object> get props => [hour, minutes];
}
