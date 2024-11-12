import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

abstract class MovieLocalDataSource{
  Future<List<PopularMoviesModel>> getCachedMovies();
  Future<Unit>cacheMovies(List<PopularMoviesModel> popularModel);
}
class MovieLocalDataSourceImp implements MovieLocalDataSource{
  @override
  Future<Unit> cacheMovies(List<PopularMoviesModel> popularModel) {
    // TODO: implement cacheMovies
    throw UnimplementedError();
  }

  @override
  Future<List<PopularMoviesModel>> getCachedMovies() {
    // TODO: implement getCachedMovies
    throw UnimplementedError();
  }
}