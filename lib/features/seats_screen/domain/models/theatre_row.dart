//

import 'package:equatable/equatable.dart';

class TheatreRow extends Equatable {
  final int id;
  final String name;
  final int sectionId;
  const TheatreRow({
    required this.id,
    required this.name,
    required this.sectionId,
  });

  @override
  List<Object?> get props => [id];
}
