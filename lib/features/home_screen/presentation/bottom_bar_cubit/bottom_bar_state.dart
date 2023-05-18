// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_bar_cubit.dart';

class BottomBarState extends Equatable {
  final BottomBarItem item;
  final double offset;

  const BottomBarState({
    required this.item,
    required this.offset,
  });

  @override
  List<Object> get props => [item, offset];

  factory BottomBarState.initial() => BottomBarState(
        item: BottomBarItem.values.first,
        offset: 0,
      );

  BottomBarState copyWith({
    BottomBarItem? item,
    double? offset,
  }) {
    return BottomBarState(
      item: item ?? this.item,
      offset: offset ?? this.offset,
    );
  }
}
