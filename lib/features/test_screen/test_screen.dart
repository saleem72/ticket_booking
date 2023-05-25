//

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import '../reservation_screen/presentation/widgets/resizable_list.dart';

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

  @override
  Widget build(BuildContext context) {
    final items = [0, 1, 2, 3, 4, 5]
        .map<DateTime>((e) => DateTime.now().add(Duration(days: e)))
        .toList();
    final totalWidth = context.mediaQuery.size.width;
    final itemWidth = (totalWidth - 120) / 5.4;
    // totalWidth: 411.42857142857144, itemWidth: 53.96825396825397
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            ResizableList(
              totalWidth: MediaQuery.of(context).size.width,
              height: 160,
              itemSize: itemWidth,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEE').format(items[index]),
                      style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      DateFormat('d').format(items[index]),
                      style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
              onItemFocus: (idx) {
                print(idx);
              },
            ),
          ],
        ),
      ),
    );
  }
}
