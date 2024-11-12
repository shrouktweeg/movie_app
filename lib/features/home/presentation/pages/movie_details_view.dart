import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/presentation/manager/home_state.dart';
import 'package:movie_app/features/home/presentation/manager/movie_details_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/categories_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/category_button_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/play_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/poster_widget.dart';
class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key,});
  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}
class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  Widget build(BuildContext context) {
    var movie= ModalRoute.of(context)!.settings.arguments as PopularMoviesModel;
    var theme =Theme.of(context);
    return BlocProvider<MovieDetailsCubit>(
  create: (context) => MovieDetailsCubit(movie),
  child: Scaffold(
        appBar: AppBar(
         iconTheme: IconThemeData(color: ColorsPalette.backIconColor),
          backgroundColor: ColorsPalette.appBarColor,
          title: Text(movie.originalTitle,style:theme.textTheme.titleMedium!.copyWith(fontSize: 20.sp,) ,),
        ),
        body:  Padding(
          padding:  EdgeInsets.all(8.0.sp),
          child: BlocBuilder<MovieDetailsCubit, HomeState>(
  builder: (context, state) {
    return ListView(
            children: [
              PlayWidget(movie: movie),
              Padding(
                padding:  EdgeInsets.only(left: 8.0.sp,top: 12.sp,bottom: 8.sp),
                child: Text(movie.originalTitle,style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18.sp),),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 8.0.sp,left: 8.sp),
                child: Text(movie.releaseDate ,style: theme.textTheme.bodySmall,),
              ),
               SizedBox(height: 18.sp,),
                Padding(
                 padding:  EdgeInsets.only(left: 10.0.sp,right: 10.sp),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    PosterWidget(movie: movie,isClicked: false,),
                     Expanded(
                       child: Column(
                         children: [
                             const Wrap(
                               children:// getList(movie).map((i) => CategoryButton(category: i)).toList(),
                             [
                               CategoryButton(category: 'Action'),
                               CategoryButton(category: 'Science Fiction'),
                               CategoryButton(category: 'Horror'),
                               CategoryButton(category: 'Music'),
                             ]
                           ),
                           Padding(
                             padding:  EdgeInsets.only(left: 8.0.sp,right: 8,top: 5.sp,),
                             child: Text(movie.overView,style: theme.textTheme.bodyMedium!.copyWith(
                               color: const Color(0XFFCBCBCB),
                             ),),
                           ),
                            SizedBox(height: 6.sp,),
                           Padding(
                             padding:  EdgeInsets.only(left: 8.0.sp,right: 8.sp),
                             child: Row(
                               children: [
                                 Icon(Icons.star,size: 28.sp,color: ColorsPalette.selectedColor,),
                                  SizedBox(width: 8.sp,),
                                 Text(movie.voteAverage.toString(),style: theme.textTheme.titleMedium!.copyWith(fontSize: 18.sp),),
                               ],
                             ),
                           )
                         ],
                       ),
                     )
                   ],),
               ),
               SizedBox(height: 3.sp,),
             CategoriesWidget(categoryName: 'More Like This', moviesList: context.read<MovieDetailsCubit>().moreLikeThis,height: 340.sp,isRecommended: true,),
                SizedBox(height: 20.sp,),
            ],
          );
  },
),
        ),
      ),
);
  }

}
