// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theatre_bloc.dart';

class TheatreState extends Equatable {
  const TheatreState._({
    required this.layers,
    required this.selectedSeats,
    required this.showBottomCard,
    required this.maxSeats,
  });

  final List<TheatreLayerDTO> layers;
  final List<SeatDTO> selectedSeats;
  final bool showBottomCard;
  final int maxSeats;

  @override
  List<Object> get props => [layers, selectedSeats, showBottomCard];

  factory TheatreState.initial() => const TheatreState._(
        layers: [],
        selectedSeats: [],
        showBottomCard: false,
        maxSeats: 0,
      );

  TheatreState copyWith({
    List<TheatreLayerDTO>? layers,
    List<SeatDTO>? selectedSeats,
    bool? showBottomCard,
    int? maxSeats,
  }) {
    return TheatreState._(
      layers: layers ?? this.layers,
      selectedSeats: selectedSeats ?? this.selectedSeats,
      showBottomCard: showBottomCard ?? this.showBottomCard,
      maxSeats: maxSeats ?? this.maxSeats,
    );
  }
}
