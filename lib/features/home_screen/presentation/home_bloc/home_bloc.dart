//

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/core/domain/models/movie.dart';

import '../../../../core/data/helpers/fixture_reader.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<_FetchMovies>(_onFetchMovies);
  }

  _onFetchMovies(_FetchMovies event, Emitter<HomeState> emit) async {
    final map = await fixture('movies.json');
    final respone = MoviesResponse.fromMap(map);
    emit(state.copyWith(group: respone));
  }
}
