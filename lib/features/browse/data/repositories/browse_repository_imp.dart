import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/core/failure/server_failure.dart';
import 'package:movie_app/features/browse/data/data_sources/movie_browse_remote.dart';
import 'package:movie_app/features/browse/data/models/browse_movie_model.dart';
import 'package:movie_app/features/browse/domain/repositories/browse_repository.dart';
import 'package:movie_app/features/browse/domain/entities/browse-entity.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

class BrowseRepositoryImp implements BrowseRepository{
  final MovieBrowseRemoteDataSource movieBrowseRemoteDataSource;

  BrowseRepositoryImp({required this.movieBrowseRemoteDataSource});
  @override
  Future<Either<Failure, List<BrowseEntity>>> getBrowsedMovie() async {


    try{
      final response=await movieBrowseRemoteDataSource.browsingMovie();
      List<BrowseEntity>getBrowsedMovies=[];
      print(response.statusCode);
      if(response.statusCode==200){
        final dataResponse=response.data["genres"];
        for(var element in dataResponse){
          getBrowsedMovies.add(BrowseMovieModel.fromJson(element));
        }
        return right(getBrowsedMovies);
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

  @override
  Future<Either<Failure, List<PopularMoviesModel>>> getBrowsedCategoryMovie()async {

    try{
      final response=await movieBrowseRemoteDataSource.browsingCategoryMovies();
      List<PopularMoviesModel>getBrowsedCategoryMovies=[];
      print(response.statusCode);
      if(response.statusCode==200){
        final dataResponse=response.data["results"];
        for(var element in dataResponse){
          getBrowsedCategoryMovies.add(PopularMoviesModel.fromJson(element));
        }
        return right(getBrowsedCategoryMovies);
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
