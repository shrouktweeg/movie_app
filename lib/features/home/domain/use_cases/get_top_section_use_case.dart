import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

class GetTopSectionUseCase{
  final HomeRepository _topSideSectionRepository;

  GetTopSectionUseCase( this._topSideSectionRepository) ;
  Future<Either<Failure,List<PopularMoviesModel>>>execute()async{
    return await _topSideSectionRepository.getTopSection();

  }
}