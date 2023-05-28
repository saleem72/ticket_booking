//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bottom_bar_cubit/bottom_bar_cubit.dart';
import '../../../../../core/presentation/widgets/glass_card.dart';
import '../../../../../core/presentation/widgets/gradient_border.dart';

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

  Widget _content(BuildContext context, BottomBarState state) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 0, end: state.offset),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: _button(state),
        );
      },
    );
  }

  Container _button(BottomBarState state) {
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
              offset: const Offset(0, 20))
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          GlassCard(
              fill: Colors.white.withOpacity(0.6),
              child: const CircularGradientBorder()),
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                state.item.icon,
                // This key causes the AnimatedSwitcher to interpret this as a "new"
                // child each time the count changes, so that it will begin its animation
                // when the count changes.
                key: ValueKey<String>(state.item.title),
              ),
              //
            ),
          )
        ],
      ),
    );
  }
}
