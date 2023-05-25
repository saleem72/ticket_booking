//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import '../../../../core/domain/models/movie.dart';

class MoviesDetialsUI extends StatelessWidget {
  const MoviesDetialsUI({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          movie.title ?? '',
          style: context.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          movie.subtitle ?? '',
          style: context.textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            movie.overview ?? '',
            style: context.textTheme.titleSmall?.copyWith(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
