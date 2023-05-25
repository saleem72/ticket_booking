//

import 'package:ticket_booking/features/seats_screen/domain/models/seat.dart';

import '../../domain/models/seat_status.dart';

class SeatDTO {
  final int id;
  final int number;
  final int sectionId;
  final String sectionName;
  final int rowId;
  final String rowName;
  final SeatStatus status;
  const SeatDTO({
    required this.id,
    required this.number,
    required this.sectionId,
    required this.sectionName,
    required this.rowId,
    required this.rowName,
    required this.status,
  });

  @override
  String toString() => "$sectionName,$rowName,$number";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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
      id: map['id'] as int,
      number: map['number'] as int,
      sectionId: map['sectionId'] as int,
      sectionName: map['sectionName'] as String,
      rowId: map['rowId'] as int,
      rowName: map['rowName'] as String,
      status: SeatStatus.fromString(map['status'] as String),
    );
  }

  Seat toDomain() {
    return Seat(
      id: id,
      number: number,
      sectionId: sectionId,
      sectionName: sectionName,
      rowId: rowId,
      rowName: rowName,
      status: status,
    );
  }
}
