//

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/helpers/fixture_reader.dart';
import '../../data/dtos/theatre_response.dart';
import '../../domain/models/seat.dart';
import '../../domain/models/seat_status.dart';
import '../../domain/models/seat_with_price.dart';
import '../../domain/models/theatre_layer.dart';

part 'theatre_event.dart';
part 'theatre_state.dart';

class TheatreBloc extends Bloc<TheatreEvent, TheatreState> {
  TheatreBloc() : super(TheatreState.initial()) {
    on<_FetchData>(_onFetchData);
    on<_SeatWasTapped>(_onSeatWasTapped);
  }

  _onSeatWasTapped(_SeatWasTapped event, Emitter<TheatreState> emit) {
    final seat = event.seat;
    if (seat.status == SeatStatus.reserved) {
      return;
    }

    if (seat.status == SeatStatus.selected) {
      final updatedSeat = seat.copyWith(status: SeatStatus.available);
      final seats = state._updateSeat(updatedSeat);
      emit(state.copyWith(seats: seats));
      return;
    }

    if (seat.status == SeatStatus.available) {
      final updatedSeat = seat.copyWith(status: SeatStatus.selected);
      final seats = state._updateSeat(updatedSeat);
      emit(state.copyWith(seats: seats));
      return;
    }
  }

  _onFetchData(_FetchData event, Emitter<TheatreState> emit) async {
    final map = await mapFromFile('theatre2.json');
    final respone = TheatreResponse.fromMap(map);
    final seats = respone.extractSeats();
    final layers = respone.extractLayers();
    emit(state.copyWith(
        layers: layers, seats: seats, maxSeats: respone.maxSeats));
  }
}
