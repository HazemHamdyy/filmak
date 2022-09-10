import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';

class GetRecommendationsUsecase extends BaseUsecase<List<Recommendation>,RecommendationsParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationsUsecase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationsParameter parameters) async{
    return await baseMoviesRepository.getRecommendations(parameters);
  }
}

class RecommendationsParameter extends Equatable {
  final int id;

  const RecommendationsParameter({required this.id});
  
  @override
  List<Object?> get props => [id];

}