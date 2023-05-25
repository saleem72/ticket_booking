//

import 'package:ticket_booking/features/seats_screen/domain/models/theatre_layer.dart';

import '../../domain/models/seat.dart';
import 'seat_dto.dart';
import 'theatre_layer_dto.dart';

class TheatreResponse {
  final List<TheatreLayerDTO> layers;
  final int maxSeats;
  TheatreResponse({
    required this.layers,
    required this.maxSeats,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'layers': layers.map((x) => x.toMap()).toList(),
      'maxSeats': maxSeats,
    };
  }

  factory TheatreResponse.fromMap(Map<String, dynamic> map) {
    return TheatreResponse(
      layers: List<TheatreLayerDTO>.from(
        (map['layers'] as List<dynamic>).map<TheatreLayerDTO>(
          (x) => TheatreLayerDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
      maxSeats: map['max_seats'] as int,
    );
  }

  List<Seat> extractSeats() {
    List<SeatDTO> result = [];

    for (int idx = 0; idx < layers.length; idx++) {
      final layer = layers[idx];
      result.addAll(layer.extractSeats());
    }

    return result.map((e) => e.toDomain()).toList();
  }

  List<TheatreLayer> extractLayers() {
    return layers.map((e) => e.toDomain()).toList();
  }
}
