
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

class MovieDetailsModel extends MovieEntity{

  const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.posterPath,
    required super.originalTitle,
    required super.releaseDate,
    required super.voteAverage,
    required super.overView,
     super.genres,
     super.homePath,
    super.genreIds,


  }) ;
  factory MovieDetailsModel.fromJson(Map<String,dynamic>jsonData){
    return MovieDetailsModel(
      backdropPath: jsonData["backdrop_path"],
      id: jsonData[ "id"],
      overView: jsonData["overview"],
      posterPath: jsonData["poster_path"],
      releaseDate: jsonData["release_date"],
      voteAverage: jsonData["vote_average"],
      originalTitle: jsonData["original_title"],
      genres: jsonData["genres"],
      homePath: jsonData["homepage"],
    );
  }
  Map<String,dynamic>toJson(){
    return {
       "id":id,
      "backdropPath":backdropPath,
      "posterPath":posterPath,
      "originalTitle":originalTitle,
      "releaseDate":releaseDate,
      "voteAverage":voteAverage,
      "overView":overView,

    };
  }

}