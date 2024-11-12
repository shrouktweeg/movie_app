import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MoviesCategories extends StatelessWidget {
  final String browseMovie;
  final String image;
  const MoviesCategories({super.key,required this.browseMovie,required this.image});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image:   DecorationImage(
              image: AssetImage(image,),fit: BoxFit.cover,opacity: 0.70.sp,),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Text(browseMovie,style: theme.textTheme.titleSmall,),
      ],
    );
  }
}