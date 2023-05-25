//

import 'package:equatable/equatable.dart';

import 'theatre_row.dart';

class TheatreSection extends Equatable {
  final int id;
  final String name;
  final double seatPrice;
  final List<TheatreRow> rows;

  const TheatreSection({
    required this.id,
    required this.name,
    required this.seatPrice,
    required this.rows,
  });

  @override
  List<Object?> get props => [id, name, seatPrice, rows];
}
