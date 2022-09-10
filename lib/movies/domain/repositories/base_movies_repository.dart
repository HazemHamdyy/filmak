import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';

abstract class BaseMoviesRepository {
  
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies(); 
  Future<Either<Failure,List<Movie>>> getPopularMovies(); 
  Future<Either<Failure,List<Movie>>> getTopRatedMovies(); 
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParam movieDetailsParam);
  Future<Either<Failure, List<Recommendation>>> getRecommendations(RecommendationsParameter recommendationsParameter);
  Future<Either<Failure,List<Movie>>> getSearchedMovies(SearchedMoviesParameters searchedMoviesParameters);
}