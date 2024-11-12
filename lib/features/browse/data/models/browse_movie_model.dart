import 'package:movie_app/features/browse/domain/entities/browse-entity.dart';

class BrowseMovieModel extends BrowseEntity{

  const BrowseMovieModel({
    required super.id,
    required super.name,
  });

  factory BrowseMovieModel.fromJson(Map<String,dynamic>jsonData){
    return BrowseMovieModel(
      id: jsonData['id'],
      name: jsonData['name'],

    );
  }

}