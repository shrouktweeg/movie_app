import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/presentation/widgets/categories_widget.dart';

class SummaryOfMovie extends StatelessWidget {
  final List<PopularMoviesModel>moviesList;
  const SummaryOfMovie({super.key,required this.moviesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.sp,
      color: ColorsPalette.containerColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         CategoriesWidget(categoryName: 'Recommended', moviesList: moviesList),
        ],
      ),
    );
  }
}
