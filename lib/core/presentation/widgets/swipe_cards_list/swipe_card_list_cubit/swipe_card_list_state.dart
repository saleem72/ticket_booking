// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'swipe_card_list_cubit.dart';

class SwipeCardListState extends Equatable {
  const SwipeCardListState._({
    required this.list,
    required this.position,
    required this.isDrag,
    required this.angle,
  });

  final List<dynamic> list;
  final Offset position;
  final bool isDrag;
  final double angle;

  @override
  List<Object> get props => [list, position, isDrag, angle];

  factory SwipeCardListState.initial({required List<dynamic> list}) =>
      SwipeCardListState._(
        list: list,
        position: Offset.zero,
        isDrag: false,
        angle: 0,
      );

  SwipeCardListState copyWith({
    List<dynamic>? list,
    Offset? position,
    bool? isDrag,
    double? angle,
  }) {
    return SwipeCardListState._(
      list: list ?? this.list,
      position: position ?? this.position,
      isDrag: isDrag ?? this.isDrag,
      angle: angle ?? this.angle,
    );
  }
}
