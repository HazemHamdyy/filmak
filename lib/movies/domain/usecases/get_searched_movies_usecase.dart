import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';

class GetSearchedMoviesUsecase extends BaseUsecase<List<Movie>,SearchedMoviesParameters> {
 final BaseMoviesRepository baseMoviesRepository ;

  GetSearchedMoviesUsecase({required this.baseMoviesRepository});


  @override
  Future<Either<Failure, List<Movie>>> call(SearchedMoviesParameters parameters) async{
    return await baseMoviesRepository.getSearchedMovies(parameters);
  }

}

class SearchedMoviesParameters extends Equatable{
  final String searchingString ;

  SearchedMoviesParameters({required this.searchingString});
  
  @override
  List<Object?> get props => [searchingString];


}