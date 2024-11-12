import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/web_services.dart';
import 'package:movie_app/features/home/data/data_sources/movie_local_data_source.dart';
import 'package:movie_app/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/data/repositories/home_repository_imp.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';
import 'package:movie_app/features/home/domain/use_cases/get_more_like-this_use_case.dart';
import 'package:movie_app/features/home/domain/use_cases/get_movie_details_use_case.dart';

import 'package:movie_app/features/home/presentation/manager/home_state.dart';


class MovieDetailsCubit extends Cubit<HomeState> {
  late MovieEntity movie;
  MovieDetailsCubit( movie) : super(
      InitialState()){
    getMovieDetails(movieId: movie.id);
    getMoreLikeThis(movie.id);
  }
  static MovieDetailsCubit get(context) => BlocProvider.of(context);
  final WebServices _webServices = WebServices();
  late GetMovieDetailsUseCase _getMovieDetailsUseCase ;
  late GetMoreLikeThisUseCase _getMoreLikeThisUseCase;
  late HomeRepository _movieDetailsRepository;
  late MovieRemoteDataSource _movieRemoteDataSource;
  late MovieLocalDataSource _movieLocalDataSource;
  List<PopularMoviesModel>_moreLikeThisList=[];
  MovieDetailsModel? _movieDetails;
  List<PopularMoviesModel>get moreLikeThis=>_moreLikeThisList;
  MovieEntity get movieDetails=>_movieDetails!;


  Future<void> getMovieDetails({required int movieId}) async {
    //ui --> view model --> useCase --> abstract repo
    _movieRemoteDataSource=MovieRemoteDataSourceImp(_webServices.dio );
    _movieLocalDataSource=MovieLocalDataSourceImp();
    _movieDetailsRepository=HomeRepositoryImp(movieRemoteDataSource: _movieRemoteDataSource, movieLocalDataSource: _movieLocalDataSource);
    _getMovieDetailsUseCase=GetMovieDetailsUseCase( _movieDetailsRepository);
    final result = await _getMovieDetailsUseCase.execute(movie.id);
    return result.fold((fail){
      emit(ErrorState());
    },(data){
      _movieDetails=data;
      emit(SuccessState());
    });
  }
  Future<void> getMoreLikeThis(int movieId) async {
    //ui --> view model --> useCase --> abstract repo
    _movieRemoteDataSource=MovieRemoteDataSourceImp(_webServices.dio );
    _movieLocalDataSource=MovieLocalDataSourceImp();
    _movieDetailsRepository=HomeRepositoryImp(movieRemoteDataSource: _movieRemoteDataSource, movieLocalDataSource: _movieLocalDataSource);
    _getMoreLikeThisUseCase=GetMoreLikeThisUseCase( _movieDetailsRepository);
    final result = await _getMoreLikeThisUseCase.execute(movieId);
    return result.fold((fail){
      emit(ErrorState());
    },(data){
      _moreLikeThisList=data;
      emit(SuccessState());
    });
  }
}
