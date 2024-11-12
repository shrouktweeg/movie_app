import 'package:dio/dio.dart';
abstract class MovieRemoteDataSource{
 Future<Response> getTopSection();
 Future<Response> getUpComing();
 Future<Response> getRecommended();
 Future<Response> getMovieDetails(int movieId);
 Future<Response> getMoviesLikeThis(int movieId);

}
class MovieRemoteDataSourceImp implements MovieRemoteDataSource{ 
 final Dio _dio;
  MovieRemoteDataSourceImp(this._dio);
@override
 Future<Response> getTopSection() async{
 return await _dio.get('movie/popular',);
 }

  @override
  Future<Response> getUpComing() async{
   return await _dio.get('movie/upcoming',);
  }

  @override
  Future<Response> getRecommended() async{
   return await _dio.get('movie/top_rated',);
  }

  @override
  Future<Response> getMovieDetails(int movieId) async{
   return await _dio.get('movie/$movieId',);
  }

  @override
  Future<Response> getMoviesLikeThis(int movieId)async {
   return await _dio.get('movie/$movieId/similar',);
  }
}