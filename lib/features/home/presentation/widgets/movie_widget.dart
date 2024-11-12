import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/presentation/widgets/play_widget.dart';

class MovieWidget extends StatelessWidget {
  final PopularMoviesModel movie;

  const MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlayWidget(movie: movie),
          SizedBox(height: 10.sp),
          Padding(
            padding: EdgeInsets.only(left: 89.0.sp,right:8.sp ),
            child: Text(
              movie.originalTitle,
              style: theme.textTheme.bodyMedium,
              overflow: TextOverflow.clip,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 89.0.sp),
            child: Center(
              child: Text(
                movie.releaseDate,
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),

        ],
      ),
    );
  }
}