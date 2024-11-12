import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

abstract class SearchRepository{

  Future<Either<Failure,List<PopularMoviesModel>>>getSearchedMovie(String movieName);

}