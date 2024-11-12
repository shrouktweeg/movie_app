import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/core/failure/server_failure.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/search/data/data_sources/movie_search_remote.dart';
import 'package:movie_app/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImp implements SearchRepository{
  final MovieSearchRemoteDataSource movieSearchRemoteDataSource;

  SearchRepositoryImp({required this.movieSearchRemoteDataSource});
  @override
  Future<Either<Failure, List<PopularMoviesModel>>> getSearchedMovie(String movieName) async {
    try{
      final response=await movieSearchRemoteDataSource.searchingMovie(movieName);
      List<PopularMoviesModel>getSearchedMovies=[];
      print(response.statusCode);
      if(response.statusCode==200){
        final dataResponse=response.data["results"];
        for(var element in dataResponse){
          getSearchedMovies.add(PopularMoviesModel.fromJson(element));
        }
        return right(getSearchedMovies);
      }else{
        return left(ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data["message"],
        ));
      }
    }on DioException catch(dioException){
      return left(ServerFailure(
        statusCode:dioException.response?.statusCode.toString()??"",
        message: dioException.error.toString(),
      ));
    }

  }
}
