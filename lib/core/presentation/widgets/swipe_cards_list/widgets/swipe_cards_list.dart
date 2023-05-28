//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';
import 'package:ticket_booking/core/presentation/widgets/swipe_cards_list/swipe_card_list_cubit/swipe_card_list_cubit.dart';

enum SwipeCardStatus { left, right, up }

class SwipeCardsList extends StatelessWidget {
  const SwipeCardsList({
    super.key,
    required this.list,
    // required this.itemBuilder,
  });

  final List<dynamic> list;
  // final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwipeCardListCubit(
        list: list,
      ),
      child: const _SwipeCardsListContent(),
    );
  }
}

class _SwipeCardsListContent extends StatefulWidget {
  const _SwipeCardsListContent(
      //   {
      //   super.key,
      // }
      );

  @override
  State<_SwipeCardsListContent> createState() => _SwipeCardsListContentState();
}

class _SwipeCardsListContentState extends State<_SwipeCardsListContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SwipeCardListCubit>().setScreenSize(context.mediaQuery.size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipeCardListCubit, SwipeCardListState>(
      buildWhen: (previous, current) => previous.list != current.list,
      builder: (context, state) {
        return Stack(
          children: [
            ...state.list.map(
              (e) => SwipableCard(
                item: e,
                isFront: e == state.list.last,
              ),
            ),
          ],
        );
      },
    );
  }
}

class SwipableCard extends StatelessWidget {
  const SwipableCard({
    super.key,
    required this.item,
    required this.isFront,
  });
  final dynamic item;
  final bool isFront;
  @override
  Widget build(BuildContext context) {
    return isFront
        ? SwipableFrontCard(item: item)
        : SwipableNormalCard(item: item);
  }
}

class SwipableFrontCard extends StatelessWidget {
  const SwipableFrontCard({
    super.key,
    required this.item,
  });
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) =>
          context.read<SwipeCardListCubit>().onPanStart(details),
      onPanUpdate: (details) =>
          context.read<SwipeCardListCubit>().onPanUpdate(details),
      onPanEnd: (details) =>
          context.read<SwipeCardListCubit>().onPanEnd(details),
      child: LayoutBuilder(
        builder: (context, constrains) {
          return BlocBuilder<SwipeCardListCubit, SwipeCardListState>(
            builder: (context, state) {
              final milliseconds = state.isDrag ? 0 : swipeListLongAnimation;
              final center = constrains.smallest.center(Offset.zero);
              final rotateMatrix = Matrix4.identity()
                ..translate(center.dx, center.dy)
                ..rotateZ(state.angle)
                ..translate(-center.dx, -center.dy);
              return AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: milliseconds),
                transform: rotateMatrix
                  ..translate(
                    state.position.dx,
                    state.position.dy,
                  ),
                child: SwipableNormalCard(item: item),
              );
            },
          );
        },
      ),
    );
  }
}

class SwipableNormalCard extends StatelessWidget {
  const SwipableNormalCard({
    super.key,
    required this.item,
  });
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: item as Color,
    );
  }
}
