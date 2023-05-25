//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import 'app_bar_button.dart';

class GlassyAppBar extends StatelessWidget {
  const GlassyAppBar({
    super.key,
    required this.trailingIcon,
    required this.trailingAction,
    this.title,
  });

  final IconData trailingIcon;
  final VoidCallback trailingAction;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 24),
        height: 64,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarButton(
                  onPressed: () => context.navigator.pop(),
                  icon: Icons.arrow_back,
                ),
                AppBarButton(
                  onPressed: () => trailingAction(),
                  icon: trailingIcon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
