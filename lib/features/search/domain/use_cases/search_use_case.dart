import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/search/domain/repositories/search_repository.dart';

class GetSearchUseCase{
  final SearchRepository _getSearchUseCase;

  GetSearchUseCase( this._getSearchUseCase) ;
  Future<Either<Failure,List<PopularMoviesModel>>>execute(String movieName)async{
    return await _getSearchUseCase.getSearchedMovie(movieName);
  }
}