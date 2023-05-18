//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/features/home_screen/presentation/bottom_bar_cubit/bottom_bar_cubit.dart';

import '../../../domain/models/bottom_bar_item.dart';

class BottomBarButton extends StatefulWidget {
  const BottomBarButton({
    super.key,
    required this.item,
  });

  final BottomBarItem item;

  @override
  State<BottomBarButton> createState() => _BottomBarButtonState();
}

class _BottomBarButtonState extends State<BottomBarButton> {
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.item == BottomBarItem.values.first) {
        final position = _onPressed(context);
        context.read<BottomBarCubit>().activeItem(widget.item, position);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      width: 44,
      height: 44,
      child: Center(child: Icon(widget.item.icon)),
    );
  }

  double _onPressed(BuildContext context) {
    RenderBox? child = _key.currentContext?.findRenderObject() as RenderBox?;
    Offset childOffset =
        child?.localToGlobal(Offset.zero) ?? const Offset(0, 0);

    return childOffset.dx;
  }
}
