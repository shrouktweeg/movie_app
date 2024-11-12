import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/web_services.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

import 'package:movie_app/features/home/presentation/manager/home_state.dart';
import 'package:movie_app/features/search/data/data_sources/movie_search_remote.dart';
import 'package:movie_app/features/search/data/repositories/search_repository_imp.dart';
import 'package:movie_app/features/search/domain/repositories/search_repository.dart';
import 'package:movie_app/features/search/domain/use_cases/search_use_case.dart';

class SearchCubit extends Cubit<HomeState> {
   String movieName;
  SearchCubit(this.movieName) : super(
      InitialState()) {
    getSearchedList(movieName: movieName);
  }

  static SearchCubit get(context) => BlocProvider.of(context);
  final WebServices _webServices = WebServices();
  late GetSearchUseCase _getSearchUseCase;

  late SearchRepository _searchRepository;
  late MovieSearchRemoteDataSource _movieSearchRemoteDataSource;
  List<PopularMoviesModel> _searchedList = [];

  List<PopularMoviesModel> get searchedList => _searchedList;

  Future<void> getSearchedList({required String movieName}) async {
    //ui --> view model --> useCase --> abstract repo
    _movieSearchRemoteDataSource =
        MovieSearchRemoteDataSourceImp(_webServices.dio);
    _searchRepository = SearchRepositoryImp(
        movieSearchRemoteDataSource: _movieSearchRemoteDataSource);
    _getSearchUseCase = GetSearchUseCase(_searchRepository);
    final result = await _getSearchUseCase.execute(movieName);
    return result.fold((fail) {
      emit(ErrorState());
    }, (data) {
      _searchedList = data;
      emit(SuccessState());
    });
  }
}
