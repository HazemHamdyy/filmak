import 'package:movies_app/movies/domain/entities/recommendation.dart';

class ReCommendationModel extends Recommendation {
  const ReCommendationModel({required super.backdropPath, required super.id});

  factory ReCommendationModel.fromJson(Map<String, dynamic> jsonData) {
    return ReCommendationModel(
        backdropPath: jsonData['backdrop_path'] ??
            "",
        id: jsonData["id"]);
  }
}
