import 'package:dio/dio.dart';
abstract class MovieBrowseRemoteDataSource{
  Future<Response> browsingMovie();
  Future<Response> browsingCategoryMovies();
}
class MovieBrowseRemoteDataSourceImp implements MovieBrowseRemoteDataSource{
  final Dio _dio;
  MovieBrowseRemoteDataSourceImp(this._dio);
  @override
  Future<Response> browsingMovie() async{
    return await _dio.get('genre/movie/list',);
  }

  @override
  Future<Response> browsingCategoryMovies() async{
    return await _dio.get('discover/movie',);
  }


}