//

import 'package:flutter/material.dart';

import '../../../../configuration/constants/constants.dart';
import '../../../../core/domain/models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.borderRadius = 0,
  });
  final Movie movie;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConstants.imageCardRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        clipBehavior: Clip.hardEdge,
        child: movie.posterPathLowResURLString == null
            ? const Icon(Icons.image)
            : Image.network(
                movie.posterPathLowResURLString!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
