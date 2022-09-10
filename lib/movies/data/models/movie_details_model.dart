import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.genres,
      required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAvg});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieDetailsModel(
        genres: List<GenresModel>.from(jsonData['genres'].map((e) => GenresModel.fromJson(e))),
        backdropPath: jsonData['backdrop_path'] ?? "",
        id: jsonData['id'],
        overview: jsonData['overview'],
        releaseDate: jsonData['release_date'],
        runtime: jsonData['runtime'],
        title: jsonData['title'],
        voteAvg: jsonData['vote_average'].toDouble());
  }
}
