import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_events.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvents, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationsUsecase getRecommendationsUsecase;

  MovieDetailsBloc(
      {required this.getMovieDetailsUsecase,
      required this.getRecommendationsUsecase})
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvents>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvents event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUsecase(MovieDetailsParam(movieID: event.id));
    result.fold(
        (failure) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: failure.message)),
        (movieDetails) => emit(state.copyWith(
            movieDetails: movieDetails,
            movieDetailsState: RequestState.loaded))
            );
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationsUsecase(RecommendationsParameter(id: event.id));
    result.fold(
        (failure) => emit(state.copyWith(
            recommendationsState: RequestState.error,
            recommendationsMessage: failure.message)),
        (recommendations) => emit(state.copyWith(
          recommendationsList: recommendations,
          recommendationsState: RequestState.loaded
        )));
  }
}
