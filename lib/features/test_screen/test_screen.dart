//

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ticket_booking/core/presentation/widgets/swipe_cards_list/widgets/swipe_cards_list.dart';

extension RadianToDegree on double {
  double toRadian() {
    // 360 = 2 * pi
    // 1 = 2 * pi / 360
    // 1 = pi / 180
    return this * math.pi / 180;
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late ScrollController _controller;
  double topItem = 0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        double value = _controller.offset / 110;

        setState(() {
          topItem = value;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

/*
 final height =
        context.mediaQuery.size.height * AppConstants.clippedCardHeightRatio;
    return SizedBox(
      height: height,
      width: height * AppConstants.clippedCardWidthRatio,
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: const SwipeCardsList(
        list: [
          Colors.blue,
          Colors.amber,
          Colors.green,
          Colors.grey,
          Colors.orange,
          Colors.purple,
        ],
      ),
    );
  }
}
