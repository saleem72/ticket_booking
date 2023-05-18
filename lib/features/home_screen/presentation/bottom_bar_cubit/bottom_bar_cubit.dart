//

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/features/home_screen/domain/models/bottom_bar_item.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarState.initial());

  activeItem(BottomBarItem item, double offset) {
    print('activeItem ${item.title}, Offset: $offset');
    emit(state.copyWith(item: item, offset: offset));
  }
}
