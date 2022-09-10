import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genresIDs,
      required super.overview,
      required super.voteAvg,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
        id: jsonData['id'],
        title: jsonData['title'],
        backdropPath: jsonData["backdrop_path"] ?? "",
        genresIDs: List<int>.from(jsonData["genre_ids"].map((e) => e)),
        overview: jsonData['overview'],
        voteAvg: jsonData['vote_average'].toDouble(),
        releaseDate: jsonData['release_date']);
  }
}
