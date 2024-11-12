import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/web_services.dart';
import 'package:movie_app/features/home/data/data_sources/movie_local_data_source.dart';
import 'package:movie_app/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/data/repositories/home_repository_imp.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';
import 'package:movie_app/features/home/domain/use_cases/get_recommended_use_case.dart';
import 'package:movie_app/features/home/domain/use_cases/get_top_section_use_case.dart';
import 'package:movie_app/features/home/domain/use_cases/upcoming_use_case.dart';
import 'package:movie_app/features/home/presentation/manager/home_state.dart';



class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState()){
    getTopSection();
    getUpComing();
    getTopRated();
  }
  static HomeCubit get(context) => BlocProvider.of(context);
  final WebServices _webServices = WebServices();
  late GetTopSectionUseCase _getTopSectionUseCase;
  late GetUpComingUseCase _getUpComingUseCase;
  late GetRecommendedUseCase _getRecommendedUseCase;
  late HomeRepository _topSideSectionRepository;
  late MovieRemoteDataSource _movieRemoteDataSource;
  late MovieLocalDataSource _movieLocalDataSource;
  List<PopularMoviesModel>_popularMovieList=[];
  List<PopularMoviesModel>_posterMovieList=[];
  List<PopularMoviesModel>_recommendedMovieList=[];
  List<PopularMoviesModel>get popularMovieList=>_popularMovieList;
  List<PopularMoviesModel>get posterMovieList=>_posterMovieList;
  List<PopularMoviesModel>get recommendedMovieList=>_recommendedMovieList;

  Future<void> getTopSection() async {
    //ui --> view model --> useCase --> abstract repo
    _movieRemoteDataSource=MovieRemoteDataSourceImp(_webServices.dio );
    _movieLocalDataSource=MovieLocalDataSourceImp();
    _topSideSectionRepository=HomeRepositoryImp(movieRemoteDataSource: _movieRemoteDataSource, movieLocalDataSource: _movieLocalDataSource);
    _getTopSectionUseCase=GetTopSectionUseCase( _topSideSectionRepository);
    final result = await _getTopSectionUseCase.execute();
    return result.fold((fail){
      emit(ErrorState());
    },(data){
      _popularMovieList=data;
      emit(SuccessState());
    });
  }
  Future<void> getUpComing() async {
    //ui --> view model --> useCase --> abstract repo
    _movieRemoteDataSource=MovieRemoteDataSourceImp(_webServices.dio );
    _movieLocalDataSource=MovieLocalDataSourceImp();
    _topSideSectionRepository=HomeRepositoryImp(movieRemoteDataSource: _movieRemoteDataSource, movieLocalDataSource: _movieLocalDataSource);
    _getUpComingUseCase=GetUpComingUseCase( _topSideSectionRepository);
    final result = await _getUpComingUseCase.execute();
    return result.fold((fail){
      emit(ErrorState());
    },(data){
      _posterMovieList=data;
      emit(SuccessState());
    });
  }
  Future<void> getTopRated() async {
    //ui --> view model --> useCase --> abstract repo
    _movieRemoteDataSource=MovieRemoteDataSourceImp(_webServices.dio );
    _movieLocalDataSource=MovieLocalDataSourceImp();
    _topSideSectionRepository=HomeRepositoryImp(movieRemoteDataSource: _movieRemoteDataSource, movieLocalDataSource: _movieLocalDataSource);
    _getRecommendedUseCase=GetRecommendedUseCase( _topSideSectionRepository);
    final result = await _getRecommendedUseCase.execute();
    return result.fold((fail){
      emit(ErrorState());
    },(data){
      _recommendedMovieList=data;
      emit(SuccessState());
    });
  }


}
