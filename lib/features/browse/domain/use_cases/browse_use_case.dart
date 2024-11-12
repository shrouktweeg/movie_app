import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/browse/domain/repositories/browse_repository.dart';
import 'package:movie_app/features/browse/domain/entities/browse-entity.dart';

class GetBrowseUseCase{
  final BrowseRepository _getBrowseUseCase;

  GetBrowseUseCase( this._getBrowseUseCase) ;
  Future<Either<Failure,List<BrowseEntity>>>execute()async{
    return await _getBrowseUseCase.getBrowsedMovie();
  }
}