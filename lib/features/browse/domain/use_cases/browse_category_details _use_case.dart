import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/browse/domain/repositories/browse_repository.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

class GetBrowseCategoryUseCase{
  final BrowseRepository _getBrowseCategoryUseCase;

  GetBrowseCategoryUseCase( this._getBrowseCategoryUseCase) ;
  Future<Either<Failure,List<PopularMoviesModel>>>execute()async{
    return await _getBrowseCategoryUseCase.getBrowsedCategoryMovie();
  }
}