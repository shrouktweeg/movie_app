import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/core/config/constants.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/presentation/manager/home_state.dart';
import 'package:movie_app/features/search/presentation/manager/search_cubit.dart';
import 'package:movie_app/features/watchList/presentation/widgets/movie_widget.dart';
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    List<PopularMoviesModel> searchResults = [];
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: 28.0.sp, horizontal: 25.sp),
      child: Column(
        children: [
          TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.sp),
                ),
                hintText: 'Search',
                hintStyle: theme.textTheme.bodyMedium,
                fillColor: ColorsPalette.borderColor,
                filled: true,
                prefixIcon: Icon(Icons.search, size: 25.sp,),
                prefixIconColor: ColorsPalette.iconsColor,
              ), onChanged: (controller) {
            if (controller.isEmpty) {
              setState(() {
                searchResults = [];
              });
            } else {
              context.read<SearchCubit>().getSearchedList(movieName: controller.toLowerCase());
            }
          },
             ),
          Expanded(
            child: BlocBuilder<SearchCubit, HomeState>(
              builder: (context, state) {
                searchResults=context.read<SearchCubit>().searchedList;
                if (state is InitialState) {
                  return Center(
                      child: CircularProgressIndicator(
                        color: ColorsPalette.iconsColor,
                      ));
                  }
                      else if (state is SuccessState) {
                    if (searchResults.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Image.asset(Constants.localMoviesIcon),
                           SizedBox(height: 15.sp,),
                          Text('No movies found', style: theme.textTheme.bodyMedium,),
                          const Spacer(),
                        ],
                      );
                    } else {
                      return MovieShortWidget(searchedMoviesList: searchResults,isSaved: false,);
                    }
                  } else if (state is ErrorState) {
                  return Center(child: Text('Error: ${state.toString()}'));
                }
                return Container();
              },
            ),
          ),
    ]),)
    );
  }
}