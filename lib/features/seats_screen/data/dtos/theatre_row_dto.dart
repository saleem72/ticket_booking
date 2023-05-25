//

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'seat_dto.dart';

class TheatreRowDTO extends Equatable {
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
  List<Object?> get props => [id, name, sectionId, seats];

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

  String toJson() => json.encode(toMap());

  factory TheatreRowDTO.fromJson(String source) =>
      TheatreRowDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  TheatreRowDTO copyWith({
    int? id,
    String? name,
    int? sectionId,
    List<SeatDTO>? seats,
  }) {
    return TheatreRowDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      sectionId: sectionId ?? this.sectionId,
      seats: seats ?? this.seats,
    );
  }
}
