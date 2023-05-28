//

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/configuration/routing/screens.dart';
import 'package:ticket_booking/core/presentation/widgets/swipe_cards_list/widgets/swipe_cards_list.dart';

part 'swipe_card_list_state.dart';

const double swipeListMaxAngle = 20;
const double swipeListRotationAngle = 20;
const double swipeListsHorizontalDelta = 100;
const double swipeListsVericalDelta = 20;
const int swipeListShortAnimation = 200;
const int swipeListLongAnimation = 400;

class SwipeCardListCubit extends Cubit<SwipeCardListState> {
  SwipeCardListCubit({
    required List<dynamic> list,
  })  : _originalList = list,
        super(SwipeCardListState.initial(list: list));

  // ignore: unused_field
  final List<dynamic> _originalList;
  Size _screenSize = Size.zero;

  setScreenSize(Size size) {
    _screenSize = size;
  }

  onPanStart(DragStartDetails details) {
    emit(state.copyWith(isDrag: true));
  }

  onPanUpdate(DragUpdateDetails details) {
    final position = state.position + details.delta;
    final x = position.dx;

    final angle = (swipeListMaxAngle * x / _screenSize.width).toRadian();
    emit(state.copyWith(position: position, angle: angle));
  }

  onPanEnd(DragEndDetails details) {
    final status = getStatus();
    switch (status) {
      case SwipeCardStatus.right:
        _goesRight();
        break;
      case SwipeCardStatus.left:
        _goesLeft();
        break;
      case SwipeCardStatus.up:
        _goesUp();
        break;
      default:
        _resetPosition();
    }
  }

  SwipeCardStatus? getStatus() {
    final x = state.position.dx;
    final y = state.position.dy;
    final forceGoesUp = x.abs() < swipeListsVericalDelta;

    if (x >= swipeListsHorizontalDelta) {
      return SwipeCardStatus.right;
    }

    if (x <= -swipeListsHorizontalDelta) {
      return SwipeCardStatus.left;
    }

    if (y <= -swipeListsHorizontalDelta / 2 && forceGoesUp) {
      return SwipeCardStatus.up;
    }

    return null;
  }

  _goesRight() {
    final angle = swipeListRotationAngle.toRadian();
    final position = state.position + Offset(_screenSize.width, 0);

    emit(state.copyWith(angle: angle, position: position, isDrag: false));
    _nextCard();
  }

  _goesLeft() {
    final angle = -swipeListRotationAngle.toRadian();
    final position = state.position - Offset(_screenSize.width, 0);

    emit(state.copyWith(angle: angle, position: position, isDrag: false));
    _nextCard();
  }

  _goesUp() {
    const angle = 0.0;
    final position = state.position - Offset(0, _screenSize.height);

    emit(state.copyWith(angle: angle, position: position, isDrag: false));
    _nextCard();
  }

  List<dynamic> cutEnd(List<dynamic> list) {
    final List<dynamic> result = [];
    for (int i = 0; i < list.length - 1; i++) {
      result.add(list[i]);
    }
    return result;
  }

  _nextCard() async {
    if (state.list.isEmpty) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: swipeListShortAnimation));
    final newList = cutEnd(state.list);
    emit(state.copyWith(list: newList));
    _resetPosition();
  }

  _resetPosition() {
    emit(state.copyWith(position: Offset.zero, isDrag: false, angle: 0));
  }
}
