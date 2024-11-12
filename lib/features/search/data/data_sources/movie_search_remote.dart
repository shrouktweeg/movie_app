import 'package:dio/dio.dart';
abstract class MovieSearchRemoteDataSource{
  Future<Response> searchingMovie(String movieName);
}
class MovieSearchRemoteDataSourceImp implements MovieSearchRemoteDataSource{
  final Dio _dio;
  MovieSearchRemoteDataSourceImp(this._dio);
  @override
  Future<Response> searchingMovie(String movieName) async{
    return await _dio.get('search/movie',queryParameters: {
      "query":movieName,
    });
  }

}