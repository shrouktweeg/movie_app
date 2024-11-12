import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

class PopularMoviesModel extends MovieEntity {
  const PopularMoviesModel({
    required super.id,
    required super.backdropPath,
    required super.posterPath,
    required super.originalTitle,
    required super.releaseDate,
    required super.voteAverage,
    required super.overView,
    required super.genreIds,
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> jsonData) {
    return PopularMoviesModel(
      backdropPath: jsonData["backdrop_path"] ?? '',
      genreIds: jsonData["genre_ids"] ?? [],
      id: jsonData["id"] ?? -1,
      overView: jsonData["overview"] ?? "",
      posterPath: jsonData["poster_path"] ?? "",
      releaseDate: jsonData["release_date"] ?? "",
      voteAverage: (jsonData["vote_average"] ?? 0).toDouble(),
      originalTitle: jsonData["original_title"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "backdrop_path": backdropPath,
      "poster_path": posterPath,
      "original_title": originalTitle,
      "release_date": releaseDate,
      "vote_average": voteAverage,
      "overview": overView,
      "genre_ids": genreIds,
    };
  }
}