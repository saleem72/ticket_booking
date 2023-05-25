//

import 'package:equatable/equatable.dart';
import './theatre_section.dart';

class TheatreLayer extends Equatable {
  final List<TheatreSection> sections;
  const TheatreLayer({
    required this.sections,
  });

  @override
  List<Object?> get props => [sections];
}
