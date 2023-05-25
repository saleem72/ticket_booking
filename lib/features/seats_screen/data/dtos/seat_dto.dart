//

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/models/seat_status.dart';

class SeatDTO extends Equatable {
  final int number;
  final int sectionId;
  final String sectionName;
  final int rowId;
  final String rowName;
  final SeatStatus status;
  const SeatDTO({
    required this.number,
    required this.sectionId,
    required this.sectionName,
    required this.rowId,
    required this.rowName,
    required this.status,
  });

  @override
  List<Object?> get props =>
      [number, sectionId, sectionName, rowId, rowName, status];

  @override
  String toString() => "$sectionName,$rowName,$number";

  String get id => toString();

  SeatDTO setSelected(bool selected) {
    return copyWith(
      status: selected ? SeatStatus.selected : SeatStatus.available,
    );
  }

  SeatDTO reserve() {
    return copyWith(status: SeatStatus.reserved);
  }

  static const List<SeatDTO> dummyData = [
    SeatDTO(
      number: 1,
      sectionId: 1,
      sectionName: "VIP",
      rowId: 1,
      rowName: "A",
      status: SeatStatus.available,
    ),
    SeatDTO(
      number: 2,
      sectionId: 1,
      sectionName: "VIP",
      rowId: 1,
      rowName: "A",
      status: SeatStatus.available,
    ),
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'sectionId': sectionId,
      'sectionName': sectionName,
      'rowId': rowId,
      'rowName': rowName,
      'status': status.label,
    };
  }

  factory SeatDTO.fromMap(Map<String, dynamic> map) {
    return SeatDTO(
      number: map['number'] as int,
      sectionId: map['sectionId'] as int,
      sectionName: map['sectionName'] as String,
      rowId: map['rowId'] as int,
      rowName: map['rowName'] as String,
      status: SeatStatus.fromString(map['status'] as String),
    );
  }

  SeatDTO copyWith({
    int? number,
    int? sectionId,
    String? sectionName,
    int? rowId,
    String? rowName,
    SeatStatus? status,
  }) {
    return SeatDTO(
      number: number ?? this.number,
      sectionId: sectionId ?? this.sectionId,
      sectionName: sectionName ?? this.sectionName,
      rowId: rowId ?? this.rowId,
      rowName: rowName ?? this.rowName,
      status: status ?? this.status,
    );
  }

  String toJson() => json.encode(toMap());

  factory SeatDTO.fromJson(String source) =>
      SeatDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
