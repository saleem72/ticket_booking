//

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ticket_booking/configuration/constants/constants.dart';
import 'package:ticket_booking/core/domain/models/movie.dart';
import 'package:ticket_booking/features/home_screen/domain/repository/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final http.Client client = http.Client();
  @override
  Future<MoviesResponse> fetchMovies() async {
    final url = AppConstants.baseURL + AppConstants.moviesEndpoint;
    final uri = Uri.parse(url);

    final response = await client.get(uri);

    final jsonString = json.decode(response.body);

    final result = MoviesResponse.fromMap(jsonString);
    return result;
  }
}
