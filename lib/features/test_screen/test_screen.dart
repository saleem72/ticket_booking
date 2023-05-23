//

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import 'resizable_list.dart';
import 'scroll_snap_list.dart';

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
            Container(
              color: Colors.amber,
              child: const MyList(),
            ),
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

class BlankBox extends StatelessWidget {
  const BlankBox({
    super.key,
    this.width = 50,
    this.height = 50,
    this.color = Colors.white,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        color: color,
        alignment: Alignment.center,
      ),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({
    super.key,
    this.height = 200,
  });
  final double height;
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<int> data = [];
  int _focusedIndex = 0;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      data.add(Random().nextInt(100) + 1);
    }
  }

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      _focusedIndex = index;
    });
  }

  ///Override default dynamicItemSize calculation
  double customEquation(double distance) {
    // return 1-min(distance.abs()/500, 0.2);
    return 1 - (distance / 1000);
  }

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final itemWidth = (totalWidth - 120) / 5.4;
    return Container(
      height: widget.height,
      color: Colors.orange,
      child: ScrollSnapList(
        onItemFocus: _onItemFocus,
        itemSize: itemWidth,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          if (index == data.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //horizontal
          return Container(
            color: Colors.green,
            width: itemWidth * 1.4,
            height: widget.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: widget.height,
                  width: itemWidth * 1.4,
                  color: Colors.pink,
                  child: Text("i:$index\n${data[index]}"),
                )
              ],
            ),
          );
        },
        itemCount: data.length,
        dynamicItemSize: true,
        // dynamicSizeEquation: customEquation, //optional
      ),
    );
  }
}

class TestListViewItem extends StatelessWidget {
  const TestListViewItem({
    super.key,
    required this.item,
    required this.isTop,
    required this.width,
    required this.height,
  });

  final int item;
  final bool isTop;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    print(width);
    return Container(
      alignment: Alignment.topCenter,
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.pink,
      child: Container(
        decoration: BoxDecoration(
          color: isTop ? Colors.green : Colors.grey.shade200,
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(
            'Items $item',
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
