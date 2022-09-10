import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasources/movie_remote_datasource.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';

class MoviesRepositoryImpl implements BaseMoviesRepository {
   BaseMovieRemoteDataSource baseMovieRemoteDataSource;
   MoviesRepositoryImpl({required this.baseMovieRemoteDataSource});

  @override
  
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);

    }on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies() async{
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);

    }on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async{
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);

    }on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParam movieDetailsParam) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(movieDetailsParam);
    try{
      return Right(result);

    }on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(RecommendationsParameter recommendationsParameter) async{
    final result = await baseMovieRemoteDataSource.getRecommendations(recommendationsParameter);
    try{
      return Right(result);

    }on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSearchedMovies(SearchedMoviesParameters searchedMoviesParameters) async{
    final result = await baseMovieRemoteDataSource.getSearchedMovies(searchedMoviesParameters);
    try{
      return Right(result);

    }on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  
  }