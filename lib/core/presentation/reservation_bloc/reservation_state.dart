// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reservation_bloc.dart';

class ReservationState extends Equatable {
  const ReservationState._({
    required this.date,
    required this.seats,
    required this.cost,
  });

  final DateTime date;
  final List<SeatWithPrice> seats;
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
    List<SeatWithPrice>? seats,
    double? cost,
  }) {
    return ReservationState._(
      date: date ?? this.date,
      seats: seats ?? this.seats,
      cost: cost ?? this.cost,
    );
  }

  String? section() {
    final label = (seats.firstOrNull)?.sectionName;
    return label;
  }

  String? selectedSeats() {
    String? result = seats.isEmpty
        ? null
        : (seats.map((e) => e.number.toString()).toList()).join(', ');

    if (result != null) {
      result = 'Seat $result';
    }

    return result;
  }

  String? total() {
    final result = seats.isEmpty
        ? 0.0
        : seats.fold<double>(0, (value, element) => value + element.price);

    if (result == 0) {
      return null;
    } else {
      return 'Total: \$${result.ceil()}';
    }
  }
}
