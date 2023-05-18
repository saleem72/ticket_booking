//

import 'package:ticket_booking/core/domain/models/movie.dart';

abstract class IHomeRepository {
  Future<MoviesResponse> fetchMovies();
}
