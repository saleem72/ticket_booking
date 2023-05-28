//

import 'package:ticket_booking/features/seats_screen/domain/models/theatre_row.dart';

import 'seat_dto.dart';

class TheatreRowDTO {
  final int id;
  final String name;
  final int sectionId;
  final List<SeatDTO> seats;
  const TheatreRowDTO({
    required this.id,
    required this.name,
    required this.sectionId,
    required this.seats,
  });

  @override
  String toString() => 'TheatreRow(id: $id, name: $name)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sectionId': sectionId,
      'seats': seats.map((x) => x.toMap()).toList(),
    };
  }

  factory TheatreRowDTO.fromMap(Map<String, dynamic> map) {
    return TheatreRowDTO(
      id: map['id'] as int,
      name: map['name'] as String,
      sectionId: map['sectionId'] as int,
      seats: List<SeatDTO>.from(
        (map['seats'] as List<dynamic>).map<SeatDTO>(
          (x) => SeatDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  TheatreRow toDomain() {
    return TheatreRow(
      id: id,
      name: name,
      sectionId: sectionId,
    );
  }
}
