import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/browse/domain/entities/browse-entity.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

abstract class BrowseRepository{

  Future<Either<Failure,List<BrowseEntity>>>getBrowsedMovie();
  Future<Either<Failure,List<PopularMoviesModel>>>getBrowsedCategoryMovie();



}