//

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'seat_dto.dart';
import 'theatre_section_dto.dart';

class TheatreLayerDTO extends Equatable {
  final List<TheatreSectionDTO> sections;
  const TheatreLayerDTO({
    required this.sections,
  });

  @override
  List<Object?> get props => [sections];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  factory TheatreLayerDTO.fromMap(Map<String, dynamic> map) {
    // return List<TheatreSection>.from(
    //     l.map((model) => TheatreSection.fromMap(model)));

    return TheatreLayerDTO(
      sections: List<TheatreSectionDTO>.from(
        (map['sections'] as List<dynamic>).map<TheatreSectionDTO>(
          (x) => TheatreSectionDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TheatreLayerDTO.fromJson(String source) =>
      TheatreLayerDTO.fromMap(json.decode(source) as Map<String, dynamic>);

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
}
