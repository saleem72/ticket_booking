//

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/constants/constants.dart';

import '../../../../core/presentation/widgets/gradient_border.dart';

class ResizableList extends StatefulWidget {
  ResizableList({
    super.key,
    required this.height,
    required this.itemSize,
    required this.itemCount,
    required this.onItemFocus,
    ScrollController? listController,
    required this.totalWidth,
    this.minHeight = 80,
    this.maxHeight = 100,
    this.gap = 20,
    required this.itemBuilder,
  })  : listController = listController ?? ScrollController(),
        listPadding = (totalWidth / 2) - (itemSize * 1.4 / 2) - gap;
  final double totalWidth;
  final double height;
  final double itemSize;
  final double minHeight;
  final double maxHeight;
  final int itemCount;
  final void Function(int) onItemFocus;
  final double listPadding;
  final double gap;
  final Widget Function(BuildContext, int) itemBuilder;

  ///Allows external controller
  final ScrollController listController;

  @override
  State<ResizableList> createState() => _ResizableListState();
}

class _ResizableListState extends State<ResizableList> {
  //Current scroll-position in pixel
  double currentPixel = 0;

  //to avoid multiple onItemFocus when using updateOnScroll
  int previousIndex = -1;

  //true if initialIndex exists and first drag hasn't occurred
  bool isInit = true;

  ///Scroll list to an offset
  void _animateScroll(double location) {
    Future.delayed(Duration.zero, () {
      widget.listController.animateTo(
        location,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              //Check if the received gestures are coming directly from the ScrollSnapList. If not, skip them
              //Try to avoid inifinte animation loop caused by multi-level NotificationListener
              if (scrollInfo.depth > 0) {
                return false;
              }

              if (scrollInfo is ScrollEndNotification) {
                //snap the selection
                double offset = _calcCardLocation(
                  pixel: scrollInfo.metrics.pixels,
                  itemSize: widget.itemSize,
                );

                //only animate if not yet snapped (tolerance 0.01 pixel)
                if ((scrollInfo.metrics.pixels - offset).abs() > 0.01) {
                  _animateScroll(offset);
                }
              } else if (scrollInfo is ScrollUpdateNotification) {
                //save pixel position for scale-effect
                setState(() {
                  currentPixel = scrollInfo.metrics.pixels;
                });

                if (isInit) {
                  return true;
                }

                if (isInit == false) {
                  _calcCardLocation(
                    pixel: scrollInfo.metrics.pixels,
                    itemSize: widget.itemSize,
                  );
                }
              }

              return true;
            },
            child: _list(),
          );
        },
      ),
    );
  }

  ///Calculates target pixel for scroll animation
  ///
  ///Then trigger `onItemFocus`
  double _calcCardLocation(
      {double? pixel, required double itemSize, int? index}) {
    // pixel = listSpacing + items + gaps
    final totalSpace = (((pixel ?? 0 - (itemSize + widget.gap) / 2)) /
        (itemSize + widget.gap));
    int cardIndex = index ?? totalSpace.round();

    if (cardIndex < 0) {
      cardIndex = 0;
    } else if (cardIndex > widget.itemCount - 1) {
      cardIndex = widget.itemCount - 1;
    }

    //trigger onItemFocus
    if (cardIndex != previousIndex) {
      previousIndex = cardIndex;
      widget.onItemFocus(cardIndex);
    }

    //target position
    // final gapCounts = max(0, cardIndex - 1);
    final result = (cardIndex * itemSize) + (cardIndex * widget.gap);

    return result;
  }

  ///Calculate scale transformation for dynamic item size
  double calculateScale(int index) {
    //scroll-pixel position for index to be at the center of ScrollSnapList
    final gapsCount = max(index - 1, 0);
    double intendedPixel = index * widget.itemSize +
        widget.itemSize * 0.4 +
        gapsCount * widget.gap +
        widget.listPadding;
    double difference = intendedPixel - currentPixel;
    if (difference >= (widget.listPadding - widget.itemSize * 0.4 - 10) &&
        difference <= (widget.listPadding + widget.itemSize * 0.4 + 10)) {
      // widget.itemSize * 0.4
      return 1.4;
    }

    //default equation
    return 1;
  }

  double calculateOffset(int index) {
    final gapsCount = max(index - 1, 0);
    double intendedPixel = index * widget.itemSize +
        widget.itemSize * 0.4 +
        gapsCount * widget.gap +
        widget.listPadding;
    double difference = intendedPixel - currentPixel;
    if (difference >= (widget.listPadding - widget.itemSize * 0.4 - 10) &&
        difference <= (widget.listPadding + widget.itemSize * 0.4 + 10)) {
      // widget.itemSize * 0.4
      return -60;
    }

    if (difference >= (widget.itemSize + widget.gap - 20) &&
        difference <= (widget.listPadding - widget.itemSize * 0.4 - 10)) {
      return -20;
    }

    if (difference >= (widget.listPadding + widget.itemSize * 0.4 + 10) &&
        difference <= (widget.listPadding + widget.itemSize * 2)) {
      return -20;
    }

    return 1;
  }

  ListView _list() {
    return ListView.builder(
      controller: widget.listController,
      padding: EdgeInsets.only(
          left: widget.listPadding, right: widget.listPadding + widget.gap),
      scrollDirection: Axis.horizontal,
      itemCount: widget.itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: widget.gap),
          alignment: Alignment.bottomCenter,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: calculateOffset(index)),
            duration: const Duration(milliseconds: 200),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, value),
                child: child,
              );
            },
            child: _child(index, calculateScale(index) == 1.4),
          ),
        );
      },
    );
  }

  Widget _child(int idx, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isSelected ? widget.itemSize * 1.4 : widget.itemSize,
      height: isSelected ? widget.maxHeight : widget.minHeight,
      decoration: BoxDecoration(
        gradient: isSelected
            ? AppConstants.gradientForSelected
            : AppConstants.gradientForNormal,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        children: [
          widget.itemBuilder(context, idx),
          RectangleGradientBorder(
            gradient: isSelected
                ? AppConstants.gradientForSelectedBorder
                : AppConstants.gradientForNormalBorder,
            lineWidth: 2,
            radius: 10,
          )
        ],
      ),
    );
  }
}
