// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'seat.dart';
import 'seat_status.dart';

class SeatWithPrice {
  final int id;
  final int number;
  final int sectionId;
  final String sectionName;
  final int rowId;
  final String rowName;
  final SeatStatus status;
  final double price;

  SeatWithPrice({
    required this.id,
    required this.number,
    required this.sectionId,
    required this.sectionName,
    required this.rowId,
    required this.rowName,
    required this.status,
    required this.price,
  });

  factory SeatWithPrice.fromSeat({required Seat seat, required double price}) =>
      SeatWithPrice(
        id: seat.id,
        number: seat.number,
        sectionId: seat.sectionId,
        sectionName: seat.sectionName,
        rowId: seat.rowId,
        rowName: seat.rowName,
        status: seat.status,
        price: price,
      );
}
