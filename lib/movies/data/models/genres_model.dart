import 'package:movies_app/movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String , dynamic> jsonData) {
    return GenresModel(name: jsonData['name'], id: jsonData['id']);
  }

}