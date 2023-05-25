// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reservation_bloc.dart';

class ReservationState extends Equatable {
  const ReservationState._({
    required this.date,
    required this.seats,
    required this.cost,
  });

  final DateTime date;
  final List<String> seats;
  final double cost;

  @override
  List<Object> get props => [date, seats, cost];

  factory ReservationState.initial() => ReservationState._(
        date: DateTime.fromMillisecondsSinceEpoch(0),
        seats: const [],
        cost: 0,
      );

  ReservationState copyWith({
    DateTime? date,
    List<String>? seats,
    double? cost,
  }) {
    return ReservationState._(
      date: date ?? this.date,
      seats: seats ?? this.seats,
      cost: cost ?? this.cost,
    );
  }
}
