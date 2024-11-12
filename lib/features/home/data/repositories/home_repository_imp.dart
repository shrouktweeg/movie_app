import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/core/failure/server_failure.dart';
import 'package:movie_app/features/home/data/data_sources/movie_local_data_source.dart';
import 'package:movie_app/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

 class HomeRepositoryImp implements HomeRepository{
   final MovieRemoteDataSource movieRemoteDataSource;
   final MovieLocalDataSource movieLocalDataSource;

  HomeRepositoryImp({required this.movieRemoteDataSource, required this.movieLocalDataSource});
   @override
   Future<Either<Failure,List<PopularMoviesModel>>> getTopSection() async{
     try{
         final response=await movieRemoteDataSource.getTopSection();
         List<PopularMoviesModel>topSideSectionMovieList=[];
         print(response.statusCode);
if(response.statusCode==200){
  final dataResponse=response.data["results"];
  for(var element in dataResponse){
    topSideSectionMovieList.add(PopularMoviesModel.fromJson(element));
  }
  return right(topSideSectionMovieList);
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
   Future<Either<Failure, List<PopularMoviesModel>>> getUpComing() async{
     try{
       final response=await movieRemoteDataSource.getUpComing();
       List<PopularMoviesModel>upComingMovieList=[];
       print(response.statusCode);
       if(response.statusCode==200){
         final dataResponse=response.data["results"];
         for(var element in dataResponse){
           upComingMovieList.add(PopularMoviesModel.fromJson(element));
         }
         return right(upComingMovieList);
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
   Future<Either<Failure, List<PopularMoviesModel>>> getRecommended() async{
     try{
       final response=await movieRemoteDataSource.getRecommended();
       List<PopularMoviesModel>recommendedMovieList=[];
       print(response.statusCode);
       if(response.statusCode==200){
         final dataResponse=response.data["results"];
         for(var element in dataResponse){
           recommendedMovieList.add(PopularMoviesModel.fromJson(element));
         }
         return right(recommendedMovieList);
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
   Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int movieId) async{
     try{
       final response=await movieRemoteDataSource.getMovieDetails(movieId);
       MovieDetailsModel? getMovieDetails;
       print(response.statusCode);
       if(response.statusCode==200){
         final dataResponse=response.data;
           getMovieDetails=MovieDetailsModel.fromJson(dataResponse);

         return right(getMovieDetails);
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
  Future<Either<Failure, List<PopularMoviesModel>>> getSearchMovies(int movieId) async {
    try{
      final response=await movieRemoteDataSource.getMoviesLikeThis(movieId);
      List<PopularMoviesModel>getMovieLikeThis=[];
      print(response.statusCode);
      if(response.statusCode==200){
        final dataResponse=response.data["results"];
        for(var element in dataResponse){
          getMovieLikeThis.add(PopularMoviesModel.fromJson(element));
        }
        return right(getMovieLikeThis);
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