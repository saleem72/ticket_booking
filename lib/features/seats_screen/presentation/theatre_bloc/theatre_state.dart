// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theatre_bloc.dart';

class TheatreState extends Equatable {
  const TheatreState._({
    required this.layers,
    required this.showBottomCard,
    required this.maxSeats,
    required this.seats,
  });

  final List<TheatreLayer> layers;
  final List<Seat> seats;
  final bool showBottomCard;
  final int maxSeats;

  @override
  List<Object> get props => [layers, selectedSeats, showBottomCard, seats];

  factory TheatreState.initial() => const TheatreState._(
        layers: [],
        showBottomCard: false,
        maxSeats: 0,
        seats: [],
      );

  TheatreState copyWith({
    List<TheatreLayer>? layers,
    List<Seat>? seats,
    bool? showBottomCard,
    int? maxSeats,
  }) {
    return TheatreState._(
      layers: layers ?? this.layers,
      seats: seats ?? this.seats,
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

  double priceForSeat(Seat seat) {
    final sectionId = seat.sectionId;
    final section = layers
        .map((e) => e.sections)
        .expand((element) => element)
        .where((item) => item.id == sectionId)
        .toList()
        .first;
    return section.seatPrice;
    // .where((element) => element.where((item) => item.id == sectionId));
  }

  List<SeatWithPrice> selectedSeats() {
    final selected = seats
        .where((element) => element.status == SeatStatus.selected)
        .toList();

    final result = selected
        .map((e) => SeatWithPrice.fromSeat(seat: e, price: priceForSeat(e)))
        .toList();
    return result;
  }
}
