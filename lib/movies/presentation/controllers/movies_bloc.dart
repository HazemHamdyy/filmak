import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetSearchedMoviesUsecase getSearchedMoviesUsecase;

  MoviesBloc(
      {required this.getNowPlayingMoviesUseCase,
      required this.getPopularMoviesUseCase,
      required this.getTopRatedMoviesUseCase,
      required this.getSearchedMoviesUsecase
      })
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);

    on<GetSearcheMoviesEvent>(_getSearchedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold(
          (failure) => emit(state.CopyWith(
              nowPlayingMoviesState: RequestState.error,
              nowPlayingMoviesMessage: failure.message)),
          (nowPlayingMoviesList) => emit(state.CopyWith(
              nowPlayingMoviesList: nowPlayingMoviesList,
              nowPlayingMoviesState: RequestState.loaded)));
    } 

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
       final result = await getPopularMoviesUseCase(const NoParameters());
      result.fold(
          (failure) => emit(state.CopyWith(
              popularMoviesState: RequestState.error,
              popularMoviesMessage: failure.message)),
          (popularMoviesList) => emit(state.CopyWith(
              popularMoviesList: popularMoviesList,
              popularMoviesState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
         final result = await getTopRatedMoviesUseCase(const NoParameters());
      result.fold(
          (failure) => emit(state.CopyWith(
              topRatedMoviesState: RequestState.error,
              topRatedMoviesMessage: failure.message)),
          (topRatedMoviesList) => emit(state.CopyWith(
              topRatedMoviesList: topRatedMoviesList,
              topRatedMoviesState: RequestState.loaded)));
  }

  FutureOr<void> _getSearchedMovies(GetSearcheMoviesEvent event, Emitter<MoviesState> emit) async {
         final result = await getSearchedMoviesUsecase(SearchedMoviesParameters(searchingString: event.searchingString));
      result.fold(
          (failure) => emit(state.CopyWith(
              searchedMoviesState: RequestState.error,
              searchedMoviesMessage: failure.message)),
          (searchedMoviesList) => emit(state.CopyWith(
              searchedMoviesList: searchedMoviesList,
              searchedMoviesState: RequestState.loaded)));
  }
}
