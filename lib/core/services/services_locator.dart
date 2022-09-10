
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasources/movie_remote_datasource.dart';
import 'package:movies_app/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init(){
    //Bloc 
    sl.registerFactory(() => MoviesBloc(getNowPlayingMoviesUseCase: sl(),getPopularMoviesUseCase: sl(),getTopRatedMoviesUseCase: sl(),getSearchedMoviesUsecase: sl()));
    sl.registerFactory(() => MovieDetailsBloc(getMovieDetailsUsecase: sl(),getRecommendationsUsecase: sl()));

    //Use Case
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(() => GetRecommendationsUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(() => GetSearchedMoviesUsecase(baseMoviesRepository: sl()));

    //Repositories
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepositoryImpl(baseMovieRemoteDataSource: sl()));

    //Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDatasourceImpl());
  }


}