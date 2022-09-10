import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MovieDetails,MovieDetailsParam> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUsecase({required this.baseMoviesRepository});
  
  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParam parameters) async{
   return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParam extends Equatable {
  final int movieID;

  const MovieDetailsParam({required this.movieID});



  @override
  List<Object?> get props => [movieID];

}