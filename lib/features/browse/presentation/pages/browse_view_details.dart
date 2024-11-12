import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/features/browse/presentation/manager/browse_cubit.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/presentation/manager/home_state.dart';
import 'package:movie_app/features/watchList/presentation/widgets/movie_widget.dart';

class BrowseViewDetails extends StatefulWidget {
  const BrowseViewDetails({super.key});

  @override
  State<BrowseViewDetails> createState() => _BrowseViewDetailsState();
}

class _BrowseViewDetailsState extends State<BrowseViewDetails> {
   List<PopularMoviesModel>browseCategoryList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsPalette.backIconColor),
        backgroundColor: ColorsPalette.appBarColor,
      ),
      body: BlocBuilder<BrowseCubit, HomeState>(
          builder: (context, state) {
            browseCategoryList=context.read<BrowseCubit>().browsedCategoryList;
            if(state is SuccessState){
                return Padding(
                  padding:  EdgeInsets.all(8.0.sp),
                  child: MovieShortWidget(searchedMoviesList: browseCategoryList,isSaved: false,),
                );
            }
              else if(state is InitialState){
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorsPalette.iconsColor,
                  ),
                );
              }
              else if (state is ErrorState) {
                return Center(child: Text('Error: ${state.toString()}'));
              }
              return Container();
              }),
    );
  }
}
