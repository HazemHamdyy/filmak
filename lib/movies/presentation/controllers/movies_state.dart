import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  //Now Playing Movies
  final List<Movie> nowPlayingMoviesList;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMoviesMessage;

  //Popular Movies
  final List<Movie> popularMoviesList;
  final RequestState popularMoviesState;
  final String popularMoviesMessage;

  //Top Rated Movies
  final List<Movie> topRatedMoviesList;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;

  //Searched Movies
  final List<Movie> searchedMoviesList;
  final RequestState searchedMoviesState;
  final String searchedMoviesMessage;

  const MoviesState({
    //Now Playing Movies
    this.nowPlayingMoviesList = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMoviesMessage = " ",

    //Popular Movies
    this.popularMoviesList = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMoviesMessage = " ",

    //Top Rated Movies
    this.topRatedMoviesList = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesMessage = " ",

    //Searched Movies
    this.searchedMoviesList = const [],
    this.searchedMoviesState = RequestState.loading,
    this.searchedMoviesMessage = " ",
  });

  MoviesState CopyWith({
      //Now Playing Movies
   List<Movie>? nowPlayingMoviesList,
   RequestState? nowPlayingMoviesState,
   String? nowPlayingMoviesMessage,

  //Popular Movies
   List<Movie>? popularMoviesList,
   RequestState? popularMoviesState,
   String? popularMoviesMessage,

  //Top Rated Movies
   List<Movie>? topRatedMoviesList,
   RequestState? topRatedMoviesState,
   String? topRatedMoviesMessage,

   //Searched Movies
   List<Movie>? searchedMoviesList,
   RequestState? searchedMoviesState,
   String? searchedMoviesMessage,


  }) {
    return MoviesState(
      //Now Playing Movies
      nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
      nowPlayingMoviesState: nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMoviesMessage: nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,

      //Popular Movies
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,

      //Top Rated Movies
      topRatedMoviesList: topRatedMoviesList ?? this.topRatedMoviesList,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesMessage: topRatedMoviesMessage ?? this.topRatedMoviesMessage,

      //Searched Movies
      searchedMoviesList: searchedMoviesList ?? this.searchedMoviesList,
      searchedMoviesState: searchedMoviesState ?? this.searchedMoviesState,
      searchedMoviesMessage: searchedMoviesMessage ?? this.searchedMoviesMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMoviesList,
        nowPlayingMoviesState,
        nowPlayingMoviesMessage,
        popularMoviesList,
        popularMoviesState,
        popularMoviesMessage,
        topRatedMoviesList,
        topRatedMoviesState,
        topRatedMoviesMessage,
        searchedMoviesList,
        searchedMoviesState,
        searchedMoviesMessage
      ];
}
