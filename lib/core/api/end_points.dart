class EndPoints {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String appKey = "api_key=bd10ae905199ee7b717d790c4702df1c";
  static const String nowPlayingMoviesUrl = "$baseUrl/movie/now_playing?$appKey";
  static const String popularMoviesUrl = "$baseUrl/movie/popular?$appKey";
  static const String topRatedMoviesUrl = "$baseUrl/movie/top_rated?$appKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
  static String movieDetailsUrl(int movieID) => "$baseUrl/movie/$movieID?$appKey";
  static String recommendationsUrl(int id) => "$baseUrl/movie/$id/recommendations?$appKey";
  static String searcheMoviesUrl(String searchingString) => "$baseUrl/search/movie?$appKey&query=$searchingString";

  /* https://api.themoviedb.org/3/search/movie?api_key=bd10ae905199ee7b717d790c4702df1c&query=avengers */

}