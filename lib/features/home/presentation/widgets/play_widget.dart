import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/config/constants.dart';

class PlayWidget extends StatefulWidget {
  final MovieEntity movie;
  const PlayWidget({super.key,required this.movie});

  @override
  State<PlayWidget> createState() => _PlayWidgetState();
}

class _PlayWidgetState extends State<PlayWidget> {
  bool isPlayed=false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          imageUrl:
          "${Constants.imageDomain}${widget.movie.backdropPath}",
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(

              color: ColorsPalette.iconsColor,
            ),
          ),
          errorWidget: (_, __, ___) => Icon(
            Icons.image_not_supported,
            color: ColorsPalette.iconsColor,
          ),
        ),        IconButton(onPressed: (){
          setState(() {
            isPlayed=!isPlayed;
          });
        }, icon: isPlayed?Icon(Icons.pause,color: ColorsPalette.iconsColor,size: 34.sp,):Icon(Icons.play_arrow_rounded,color: ColorsPalette.iconsColor,size: 34.sp,),),

      ],
    );
  }

}
