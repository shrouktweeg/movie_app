import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

class GetMoreLikeThisUseCase{
  final HomeRepository _getMoreLikeThisRepository;

  GetMoreLikeThisUseCase( this._getMoreLikeThisRepository) ;
  Future<Either<Failure,List<PopularMoviesModel>>>execute(int movieId)async{
    return await _getMoreLikeThisRepository.getSearchMovies(movieId);

  }
}