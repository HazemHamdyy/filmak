import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvents extends Equatable {
  const MovieDetailsEvents();
}

class GetMovieDetailsEvents extends MovieDetailsEvents {
  final int id;

  const GetMovieDetailsEvents({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetMovieRecommendationsEvent extends MovieDetailsEvents{
  final int id;

  const GetMovieRecommendationsEvent({required this.id});
  
  @override
  List<Object?> get props => [id];



}
