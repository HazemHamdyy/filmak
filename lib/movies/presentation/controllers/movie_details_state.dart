import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  //Movie Details
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  //Recommendations
  final List<Recommendation> recommendationsList;
  final RequestState recommendationsState;
  final String recommendationsMessage;

  const MovieDetailsState(
      { //Movie Details
      this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.movieDetailsMessage = "",

      //Recommendations
      this.recommendationsList = const [],
      this.recommendationsState = RequestState.loading,
      this.recommendationsMessage = ""});

  MovieDetailsState copyWith({
    //Movie Details
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,

    //Recommendations
    List<Recommendation>? recommendationsList,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MovieDetailsState(
        //Movie Details
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,

        //Recommendations
        recommendationsList: recommendationsList ?? this.recommendationsList,
        recommendationsState: recommendationsState ?? this.recommendationsState,
        recommendationsMessage:
            recommendationsMessage ?? this.recommendationsMessage);
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendationsList,
        recommendationsState,
        recommendationsMessage
      ];
}
