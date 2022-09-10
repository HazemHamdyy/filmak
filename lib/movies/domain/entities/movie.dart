import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genresIDs;
  final String overview;
  final double voteAvg;
  final String releaseDate;

  Movie(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.genresIDs,
      required this.overview,
      required this.voteAvg,
      required this.releaseDate
      });
      
        @override
        // TODO: implement props
        List<Object?> get props => [id,title,backdropPath,genresIDs,overview,voteAvg,releaseDate];


}
