// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:equatable/equatable.dart';

class MoviesResponse {
  final List<Movie> playNow;
  final List<Movie> comingSoon;
  final List<Movie> topMovies;

  MoviesResponse({
    required this.playNow,
    required this.comingSoon,
    required this.topMovies,
  });

  // factory MoviesResponse.fromMap(Map<String, dynamic> map) {
  //   return MoviesResponse(
  //     playNow:  map['play_now'] ?? [],
  //     comingSoon: map['coming_soon'] ?? [],
  //     topMovies: map['top_movies'] ?? [],
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'playNow': playNow.map((x) => x.toMap()).toList(),
      'comingSoon': comingSoon.map((x) => x.toMap()).toList(),
      'topMovies': topMovies.map((x) => x.toMap()).toList(),
    };
  }

  factory MoviesResponse.fromMap(Map<String, dynamic> map) {
    return MoviesResponse(
      playNow: map['play_now'] == null
          ? []
          : List<Movie>.from(
              (map['play_now'] as List<dynamic>).map<Movie>(
                (x) => Movie.fromMap(x as Map<String, dynamic>),
              ),
            ),
      comingSoon: map['coming_soon'] == null
          ? []
          : List<Movie>.from(
              (map['coming_soon'] as List<dynamic>).map<Movie>(
                (x) => Movie.fromMap(x as Map<String, dynamic>),
              ),
            ),
      topMovies: List<Movie>.from(
        (map['top_movies'] as List<dynamic>).map<Movie>(
          (x) => Movie.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() =>
      'MoviesResponse(\n\tplayNow: $playNow, \n\tcomingSoon: $comingSoon, \n\ttopMovies: $topMovies\n)';
}

class Movie extends Equatable {
  final int id;
  final String? title;
  final String? subtitle;
  final String? overview;
  final String? releaseDate;
  final String? posterPathHighResURLString;
  final String? posterPathLowResURLString;
  final double? popularity;
  final double? voteAverage;
  final int? voteCount;
  final String? backdropPath;

  const Movie({
    required this.id,
    this.title,
    this.subtitle,
    this.overview,
    this.releaseDate,
    this.posterPathHighResURLString,
    this.posterPathLowResURLString,
    this.popularity,
    this.voteAverage,
    this.voteCount,
    this.backdropPath,
  });

  // var imageLowResURL:  {
  //     return URL(string: posterPathLowResURLString ?? "")
  // }

  // var imageHighResURL: URL? {
  //     return URL(string: posterPathHighResURLString ?? "")
  // }

  // var backdropPathURL: URL? {
  //     return URL(string: backdropPath ?? "")
  // }

  factory Movie.example() => const Movie(
      id: 453395,
      title: "Doctor Strange",
      subtitle: "in the Multiverse of Madness",
      overview:
          "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
      releaseDate: "2022-05-04",
      posterPathHighResURLString:
          "https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
      posterPathLowResURLString:
          "https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
      popularity: 3348.339,
      voteAverage: 7.4,
      voteCount: 2140,
      backdropPath:
          "https://image.tmdb.org/t/p/w500/gUNRlH66yNDH3NQblYMIwgZXJ2u.jpg");

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'overview': overview,
      'releaseDate': releaseDate,
      'posterPathHighResURLString': posterPathHighResURLString,
      'posterPathLowResURLString': posterPathLowResURLString,
      'popularity': popularity,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'backdropPath': backdropPath,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      releaseDate:
          map['releaseDate'] != null ? map['releaseDate'] as String : null,
      posterPathHighResURLString: map['posterPathHighResURLString'] != null
          ? map['posterPathHighResURLString'] as String
          : null,
      posterPathLowResURLString: map['posterPathLowResURLString'] != null
          ? map['posterPathLowResURLString'] as String
          : null,
      popularity: map['popularity'] != null
          ? double.parse(map["popularity"].toString())
          : null,
      voteAverage: map['voteAverage'] != null
          ? double.parse(map["voteAverage"].toString())
          : null,
      voteCount: map['voteCount'] != null ? map['voteCount'] as int : null,
      backdropPath:
          map['backdropPath'] != null ? map['backdropPath'] as String : null,
    );
  }

  @override
  String toString() {
    return 'Movie(id: $id, title: $title)';
  }

  @override
  List<Object?> get props => [id];
}
