// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:equatable/equatable.dart';

import 'seat_status.dart';

class Seat extends Equatable {
  final int id;
  final int number;
  final int sectionId;
  final String sectionName;
  final int rowId;
  final String rowName;
  final SeatStatus status;
  const Seat({
    required this.id,
    required this.number,
    required this.sectionId,
    required this.sectionName,
    required this.rowId,
    required this.rowName,
    required this.status,
  });

  @override
  List<Object?> get props => [id, status];

  @override
  String toString() => "id:$id, $sectionName,$rowName,$number";

  Seat copyWith({
    int? number,
    int? sectionId,
    String? sectionName,
    int? rowId,
    String? rowName,
    SeatStatus? status,
  }) {
    return Seat(
      id: id,
      number: number ?? this.number,
      sectionId: sectionId ?? this.sectionId,
      sectionName: sectionName ?? this.sectionName,
      rowId: rowId ?? this.rowId,
      rowName: rowName ?? this.rowName,
      status: status ?? this.status,
    );
  }
}
