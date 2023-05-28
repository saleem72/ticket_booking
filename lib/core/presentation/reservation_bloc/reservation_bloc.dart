//

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/seats_screen/domain/models/seat_with_price.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationState.initial()) {
    on<_ReservationSetDay>(_onReservationSetDay);
    on<_ReservationSetTime>(_onReservationSetTime);
    on<_UpdateSeats>(_onUpdateSeats);
  }

  _onUpdateSeats(_UpdateSeats event, Emitter<ReservationState> emit) {
    emit(state.copyWith(seats: event.seats));
  }

  _onReservationSetDay(
      _ReservationSetDay event, Emitter<ReservationState> emit) {
    emit(state.copyWith(date: event.date));
  }

  _onReservationSetTime(
      _ReservationSetTime event, Emitter<ReservationState> emit) {
    final previousDate = state.date;
    final date = DateTime(
      previousDate.year,
      previousDate.month,
      previousDate.day,
      event.hour,
      event.minutes,
    );
    emit(state.copyWith(date: date));
  }
}
