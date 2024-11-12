import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/features/home/presentation/manager/home_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/home_state.dart';
import 'package:movie_app/features/home/presentation/widgets/categories_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/head_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
       if(state is InitialState){
         return  Scaffold(
           body: Center(
             child: CircularProgressIndicator(
               color: ColorsPalette.iconsColor,
             ),
           ),
         );
       }
       else if (state is SuccessState ){
         return Scaffold(
           body: Padding(
             padding: EdgeInsets.symmetric(vertical: 2.0.sp, horizontal: 0.sp),
             child: ListView (
                 children:  [
                   HeadWidget(moviesList: context.read<HomeCubit>().popularMovieList,),
                    SizedBox(height: 22.sp,),
                   CategoriesWidget(categoryName: 'New Releases',
                     moviesList: context.read<HomeCubit>().posterMovieList ,),
                    SizedBox(height: 25.sp,),
                   CategoriesWidget(categoryName: 'Recommended',isRecommended: true,
                     moviesList: context.read<HomeCubit>().recommendedMovieList,
                     height: 340.sp,),
                 ]
             ),


           ),);
       }
       else {
         return  Center(child: CircularProgressIndicator(
           color: ColorsPalette.iconsColor,
         ));
       }
      },
    );
  }
}
