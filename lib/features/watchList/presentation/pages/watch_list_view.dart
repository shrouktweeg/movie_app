import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/core/firebase_utils.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/watchList/presentation/widgets/movie_widget.dart';
class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsPalette.primaryColor,
        elevation: 0,
        title:Text('Watchlist',style: theme.textTheme.bodyMedium!.copyWith(
          fontSize: 22.sp,
        ),),
      ),
       body:Padding(
         padding:  EdgeInsets.all(8.0.sp),
         child: StreamBuilder<QuerySnapshot<PopularMoviesModel>>(
           stream: FireBaseUtils.getMoviesList(),
           builder: (context, snapShot) {
             if (snapShot.hasError) {
               return const Center(child: Text('Something went wrong'));
             }
             if (snapShot.connectionState == ConnectionState.waiting) {
               return  Center(child: CircularProgressIndicator(
                 color: ColorsPalette.iconsColor,
               ));
             }
             if (snapShot.data == null || snapShot.data!.docs.isEmpty) {
               return const Center(child: Text('No movies found.'));
             }
             List<PopularMoviesModel> moviesList =
             snapShot.data!.docs.map((e) => e.data()).toList();
             print(moviesList);
             return MovieShortWidget(searchedMoviesList: moviesList,isSaved: true,);
           },
         ),
       )
          );
  }
}

