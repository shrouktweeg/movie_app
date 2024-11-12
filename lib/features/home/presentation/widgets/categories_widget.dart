import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:movie_app/features/home/presentation/widgets/poster_widget.dart';

class CategoriesWidget extends StatelessWidget {
  final String categoryName;
  final List<PopularMoviesModel>moviesList;
  final double height;
  final bool isRecommended;
   const CategoriesWidget({super.key,required this.categoryName,required this.moviesList,this.height=235,this.isRecommended=false});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    if (moviesList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: ColorsPalette.iconsColor,
        ),
      );
    } else {
      return Container(
      height: height.sp,
      width: double.infinity,
      decoration:BoxDecoration(
        color: ColorsPalette.containerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top:12.0.sp,bottom: 12.sp,left: 12.sp),
            child: Text(categoryName,style: theme.textTheme.bodyMedium!.copyWith(color:ColorsPalette.secondaryBodyMediumColor,fontSize: 15.sp ),),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: moviesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child:isRecommended?Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PosterWidget(movie: moviesList[index]),
                        SizedBox(height: 5.sp,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: ColorsPalette.selectedColor,size: 15.sp,),
                             SizedBox(width: 4.sp,),
                            Text(moviesList[index].voteAverage.toString(),style:theme.textTheme.titleMedium,),
                          ],
                        ),
                        Text(moviesList[index].originalTitle,style:theme.textTheme.titleMedium,),
                        Text(moviesList[index].releaseDate,style: theme.textTheme.bodySmall,)
                      ],
                    ):Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PosterWidget(movie: moviesList[index]),
                      ],
                    )
                  );
                }),
          ),

        ],
      ),
    );
    }
  }
}
