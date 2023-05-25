// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theatre_bloc.dart';

class TheatreState extends Equatable {
  const TheatreState._({
    required this.layers,
    required this.selectedSeats,
    required this.showBottomCard,
    required this.maxSeats,
    required this.seats,
  });

  final List<TheatreLayer> layers;
  final List<Seat> seats;
  final List<Seat> selectedSeats;
  final bool showBottomCard;
  final int maxSeats;

  @override
  List<Object> get props => [layers, selectedSeats, showBottomCard, seats];

  factory TheatreState.initial() => const TheatreState._(
        layers: [],
        selectedSeats: [],
        showBottomCard: false,
        maxSeats: 0,
        seats: [],
      );

  TheatreState copyWith({
    List<TheatreLayer>? layers,
    List<Seat>? seats,
    List<Seat>? selectedSeats,
    bool? showBottomCard,
    int? maxSeats,
  }) {
    return TheatreState._(
      layers: layers ?? this.layers,
      seats: seats ?? this.seats,
      selectedSeats: selectedSeats ?? this.selectedSeats,
      showBottomCard: showBottomCard ?? this.showBottomCard,
      maxSeats: maxSeats ?? this.maxSeats,
    );
  }

  List<Seat> seatsForRow(int rowId) {
    return seats.where((element) => element.rowId == rowId).toList();
  }

  List<Seat> _updateSeat(Seat seat) {
    return seats.map((item) {
      if (item.id == seat.id) {
        return seat;
      } else {
        return item;
      }
    }).toList();
  }
}
