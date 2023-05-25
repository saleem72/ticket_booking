//

import 'dart:convert';

import 'package:ticket_booking/features/seats_screen/domain/models/theatre_layer.dart';

import 'seat_dto.dart';
import 'theatre_section_dto.dart';

class TheatreLayerDTO {
  final List<TheatreSectionDTO> sections;
  const TheatreLayerDTO({
    required this.sections,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  factory TheatreLayerDTO.fromMap(Map<String, dynamic> map) {
    return TheatreLayerDTO(
      sections: List<TheatreSectionDTO>.from(
        (map['sections'] as List<dynamic>).map<TheatreSectionDTO>(
          (x) => TheatreSectionDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  static List<TheatreLayerDTO> listFromJson(String data) {
    Iterable l = json.decode(data);
    return List<TheatreLayerDTO>.from(
        l.map((model) => TheatreLayerDTO.fromMap(model)));
  }

  List<SeatDTO> extractSeats() {
    List<SeatDTO> result = [];

    for (int idx = 0; idx < sections.length; idx++) {
      final section = sections[idx];
      result.addAll(section.extractSeats());
    }

    return result;
  }

  TheatreLayer toDomain() {
    return TheatreLayer(
      sections: sections.map((e) => e.toDomain()).toList(),
    );
  }
}
