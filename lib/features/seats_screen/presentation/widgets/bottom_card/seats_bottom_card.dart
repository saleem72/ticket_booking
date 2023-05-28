//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';
import 'package:ticket_booking/configuration/routing/app_screens.dart';

import '../../../../../core/presentation/widgets/app_bar_button.dart';
import 'hollow_card_background.dart';
import 'seats_bottom_card_content.dart';

class SeatsBottomCard extends StatelessWidget {
  const SeatsBottomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216,
      width: double.maxFinite,
      child: Stack(
        children: [
          const HollowCardBackground(),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: AppBarButton(
              width: 70,
              height: 70,
              icon: Icons.home,
              label: 'Buy',
              onPressed: () => context.navigator.pushNamed(AppScreens.tickets),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SeatsBottomCardContent(),
          ),
        ],
      ),
    );
  }
}
