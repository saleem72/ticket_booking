// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'dart:convert';

import 'package:ticket_booking/features/seats_screen/domain/models/theatre_section.dart';

import 'seat_dto.dart';
import 'theatre_row_dto.dart';

class TheatreSectionDTO {
  final int id;
  final String name;
  final double seatPrice;
  final List<TheatreRowDTO> rows;

  const TheatreSectionDTO({
    required this.id,
    required this.name,
    required this.seatPrice,
    required this.rows,
  });

  @override
  String toString() =>
      'TheatreSection(id: $id, name: $name, seatPrice: $seatPrice)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'seatPrice': seatPrice,
      'rows': rows.map((x) => x.toMap()).toList(),
    };
  }

  factory TheatreSectionDTO.fromMap(Map<String, dynamic> map) {
    return TheatreSectionDTO(
      id: map['id'] as int,
      name: map['name'] as String,
      seatPrice: map['seatPrice'] != null
          ? double.parse(map["seatPrice"].toString())
          : 0,
      rows: List<TheatreRowDTO>.from(
        (map['rows'] as List<dynamic>).map<TheatreRowDTO>(
          (x) => TheatreRowDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  static List<TheatreSectionDTO> listFromJson(String data) {
    Iterable l = json.decode(data);
    return List<TheatreSectionDTO>.from(
        l.map((model) => TheatreSectionDTO.fromMap(model)));
  }

  List<SeatDTO> extractSeats() {
    List<SeatDTO> result = [];

    for (int idx = 0; idx < rows.length; idx++) {
      final row = rows[idx];
      result.addAll(row.seats);
    }

    return result;
  }

  TheatreSection toDomain() {
    return TheatreSection(
      id: id,
      name: name,
      seatPrice: seatPrice,
      rows: rows.map((e) => e.toDomain()).toList(),
    );
  }
}
