import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

import 'package:movie_app/features/home/presentation/widgets/movie_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/poster_widget.dart';

class HeadWidget extends StatefulWidget {
  final List<PopularMoviesModel>moviesList;

   const HeadWidget({super.key,required this.moviesList});

  @override
  State<HeadWidget> createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {


  @override
  Widget build(BuildContext context) {
    if (widget.moviesList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: ColorsPalette.iconsColor,
        ),
      );
    } else {
      return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.0.sp),
      child: CarouselSlider.builder(
        itemCount:widget.moviesList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
             Stack(
               clipBehavior: Clip.none,
              alignment: Alignment.bottomLeft,
              children: [
               MovieWidget(movie: widget.moviesList[itemIndex],),
                PosterWidget(movie:widget.moviesList[itemIndex])
              ],),

        options: CarouselOptions(
          aspectRatio: 13 / 9.sp,
          viewportFraction: 1.sp,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3.sp,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
    }
  }
}
