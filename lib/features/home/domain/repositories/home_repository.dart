import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

abstract class HomeRepository{

Future<Either<Failure,List<PopularMoviesModel>>>getTopSection();
Future<Either<Failure,List<PopularMoviesModel>>>getUpComing();
Future<Either<Failure,List<PopularMoviesModel>>>getRecommended();
Future<Either<Failure,MovieDetailsModel>>getMovieDetails(int movieId);
Future<Either<Failure,List<PopularMoviesModel>>>getSearchMovies(int movieId);

}