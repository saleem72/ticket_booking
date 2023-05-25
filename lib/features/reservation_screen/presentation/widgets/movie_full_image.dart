//

import 'package:flutter/material.dart';

class MovieFullImage extends StatelessWidget {
  const MovieFullImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          url,
          fit: BoxFit.fill,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.4),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
