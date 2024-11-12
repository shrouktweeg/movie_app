import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

class GetMovieDetailsUseCase{

  final HomeRepository _getMovieDetailsRepository;

  GetMovieDetailsUseCase( this._getMovieDetailsRepository) ;
  Future<Either<Failure,MovieDetailsModel>>execute(int movieId)async{
    return await _getMovieDetailsRepository.getMovieDetails(movieId);

  }
}