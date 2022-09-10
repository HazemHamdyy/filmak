import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUsecase<List<Movie>,NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase({required this.baseMoviesRepository});

@override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters)async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}