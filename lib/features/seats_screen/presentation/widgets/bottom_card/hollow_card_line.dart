//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import 'dot_view.dart';

class HollowCardLine extends StatelessWidget {
  const HollowCardLine({
    super.key,
    required this.icon,
    required this.first,
    this.second,
  });

  final IconData icon;
  final String first;
  final String? second;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        //
        const SizedBox(width: 8),
        Text(
          first,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withOpacity(0.87),
            fontSize: 15,
          ),
        ),
        const SizedBox(width: 8),
        if (second != null) const DotView(),
        const SizedBox(width: 8),
        if (second != null)
          Text(
            second!,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.87),
              fontSize: 15,
            ),
          ),
      ],
    );
  }
}
