import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/web_services.dart';
import 'package:movie_app/features/browse/data/data_sources/movie_browse_remote.dart';
import 'package:movie_app/features/browse/data/repositories/browse_repository_imp.dart';
import 'package:movie_app/features/browse/domain/use_cases/browse_category_details%20_use_case.dart';
import 'package:movie_app/features/browse/domain/use_cases/browse_use_case.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/presentation/manager/home_state.dart';
import 'package:movie_app/features/browse/domain/entities/browse-entity.dart';


class BrowseCubit extends Cubit<HomeState> {

  BrowseCubit() : super(
      InitialState()) {
    getBrowsedList();
    getBrowsedCategoryList();
  }

  static BrowseCubit get(context) => BlocProvider.of(context);
  final WebServices _webServices = WebServices();
  late GetBrowseUseCase _getBrowseUseCase;
  late GetBrowseCategoryUseCase _getBrowseCategoryUseCase;


  late BrowseRepositoryImp _browseRepository;
  late MovieBrowseRemoteDataSource _movieBrowseRemoteDataSource;
  List<BrowseEntity> _browsedList = [];
  List<PopularMoviesModel>_browsedCategoryList=[];

  List<BrowseEntity> get browsedList => _browsedList;
  List<PopularMoviesModel> get browsedCategoryList => _browsedCategoryList;

  Future<void> getBrowsedList() async {
    //ui --> view model --> useCase --> abstract repo
    _movieBrowseRemoteDataSource =
        MovieBrowseRemoteDataSourceImp(_webServices.dio);
    _browseRepository = BrowseRepositoryImp(
        movieBrowseRemoteDataSource: _movieBrowseRemoteDataSource);
    _getBrowseUseCase = GetBrowseUseCase(_browseRepository);
    final result = await _getBrowseUseCase.execute();
    return result.fold((fail) {
      emit(ErrorState());
    }, (data) {
      _browsedList = data;
      emit(SuccessState());
    });
  }
  Future<void> getBrowsedCategoryList() async {
    //ui --> view model --> useCase --> abstract repo
    _movieBrowseRemoteDataSource =
        MovieBrowseRemoteDataSourceImp(_webServices.dio);
    _browseRepository = BrowseRepositoryImp(
        movieBrowseRemoteDataSource: _movieBrowseRemoteDataSource);
    _getBrowseCategoryUseCase = GetBrowseCategoryUseCase(_browseRepository);
    final result = await _getBrowseCategoryUseCase.execute();
    return result.fold((fail) {
      emit(ErrorState());
    }, (data) {
      _browsedCategoryList = data;
      emit(SuccessState());
    });
  }
}
