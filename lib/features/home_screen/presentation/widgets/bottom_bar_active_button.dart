//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottom_bar_cubit/bottom_bar_cubit.dart';
import 'glass_card.dart';
import 'gragient_border.dart';

class BottomBarActiveButton extends StatelessWidget {
  const BottomBarActiveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        return _content(context, state);
      },
    );
  }

  Container _content(BuildContext context, BottomBarState state) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 20,
              offset: Offset(state.offset, 20))
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: const [
          GalssCard(child: GragientBorder()),
          Center(child: Icon(Icons.home))
        ],
      ),
    );
  }
}
