import 'package:dio/dio.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies(); 
  Future<List<MovieModel>> getTopRatedMovies(); 
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParam movieDetailsParam);
  Future<List<ReCommendationModel>> getRecommendations(RecommendationsParameter recommendationsParameter);
  Future<List<MovieModel>> getSearchedMovies(SearchedMoviesParameters searchedMoviesParameters);

}

class MovieRemoteDatasourceImpl extends BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{
    final response = await Dio().get(EndPoints.nowPlayingMoviesUrl);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else {
      throw ServerException(errorMessageModel:  ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(EndPoints.popularMoviesUrl);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else {
      throw ServerException(errorMessageModel:  ErrorMessageModel.fromJson(response.data));
    }
  }
  
  
  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(EndPoints.topRatedMoviesUrl);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else {
      throw ServerException(errorMessageModel:  ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParam movieDetailsParam) async{
    final response = await Dio().get(EndPoints.movieDetailsUrl(movieDetailsParam.movieID));
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }else {
      throw ServerException(errorMessageModel:  ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<ReCommendationModel>> getRecommendations(RecommendationsParameter recommendationsParameter)async{
    final response = await Dio().get(EndPoints.recommendationsUrl(recommendationsParameter.id));
    if(response.statusCode == 200){
      return List<ReCommendationModel>.from((response.data['results'] as List).map((e) => ReCommendationModel.fromJson(e)));
    }else {
      throw ServerException(errorMessageModel:  ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<MovieModel>> getSearchedMovies(SearchedMoviesParameters searchedMoviesParameters) async{
    final response = await Dio().get(EndPoints.searcheMoviesUrl(searchedMoviesParameters.searchingString));
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else {
      throw ServerException(errorMessageModel:  ErrorMessageModel.fromJson(response.data));
    }
  }
  
}