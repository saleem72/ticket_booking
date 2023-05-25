// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:equatable/equatable.dart';

class MovieTime extends Equatable {
  final int hour;
  final int minutes;

  const MovieTime({
    required this.hour,
    required this.minutes,
  });

  @override
  List<Object?> get props => [hour, minutes];

  String get label =>
      '${hour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}
