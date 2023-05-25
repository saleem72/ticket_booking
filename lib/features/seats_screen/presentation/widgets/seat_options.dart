//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';
import 'package:ticket_booking/configuration/extensions/string_extension.dart';

import '../../domain/models/seat_status.dart';
import 'bottom_card/dot_view.dart';

class SeatOptions extends StatelessWidget {
  const SeatOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...SeatStatus.values.map((e) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotView(
                  width: 10,
                  height: 10,
                  color: e.color,
                ),
                const SizedBox(width: 10),
                Text(
                  e.label.capitalize(),
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
