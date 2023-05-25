//

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/helpers/fixture_reader.dart';
import '../../data/dtos/seat_dto.dart';
import '../../data/dtos/theatre_layer_dto.dart';
import '../../data/dtos/theatre_response.dart';

part 'theatre_event.dart';
part 'theatre_state.dart';

class TheatreBloc extends Bloc<TheatreEvent, TheatreState> {
  TheatreBloc() : super(TheatreState.initial()) {
    on<_FetchData>(_onFetchData);
  }

  _onFetchData(_FetchData event, Emitter<TheatreState> emit) async {
    final map = await mapFromFile('theatre2.json');
    final respone = TheatreResponse.fromMap(map);
    emit(state.copyWith(layers: respone.layers, maxSeats: respone.maxSeats));
  }
}
