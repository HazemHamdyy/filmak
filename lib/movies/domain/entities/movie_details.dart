import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAvg;

  const MovieDetails(
      {required this.genres,
      required this.backdropPath,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.title,
      required this.voteAvg});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [backdropPath, id, overview, releaseDate, runtime, title, voteAvg,genres];
}
