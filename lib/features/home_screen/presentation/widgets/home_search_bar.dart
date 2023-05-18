//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import '../../../../configuration/constants/constants.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.onChange,
  });
  final Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
          color: const Color(0xFF767680).withOpacity(0.12),
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall)),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: context.textTheme.titleSmall?.copyWith(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.6),
            ),
            suffixIcon: Icon(
              Icons.mic,
              color: Colors.white.withOpacity(0.6),
            ),
            // contentPadding: const EdgeInsets.only(top: 4),
            hintText: 'Search',
            hintStyle: context.textTheme.titleSmall?.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.6),
            ),
            contentPadding: const EdgeInsets.only(bottom: 12)),
      ),
    );
  }
}
