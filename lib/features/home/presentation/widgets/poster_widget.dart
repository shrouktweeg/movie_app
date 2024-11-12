import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/core/config/constants.dart';
import 'package:movie_app/core/config/page_routes_name.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:provider/provider.dart';
import '../../../watchList/presentation/provider/movie_provider.dart';

class PosterWidget extends StatefulWidget {
  final PopularMoviesModel movie;
  final bool isClicked;
  const PosterWidget({super.key, required this.movie, this.isClicked = true});

  @override
  State<PosterWidget> createState() => _PosterWidgetState();
}

class _PosterWidgetState extends State<PosterWidget> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).loadSavedState(widget.movie.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    bool isSaved = movieProvider.isMovieSaved(widget.movie.id.toString());

    return InkWell(
      onTap: widget.isClicked ? () {
        Navigator.pushNamed(
            context, PageRoutesName.movieDetails, arguments: widget.movie);
      } : () {},
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          CachedNetworkImage(
            imageUrl: "${Constants.imageDomain}${widget.movie.posterPath}",
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: ColorsPalette.iconsColor,
              ),
            ),
            errorWidget: (_, __, ___) => Icon(
              Icons.image_not_supported,
              color: ColorsPalette.iconsColor,
            ),
            width: 100.sp,
          ),
          Positioned(
            top: -2.sp,
            left: -4.sp,
            child: InkWell(
              onTap: () async {
                if (!isSaved) {
                await  movieProvider.addMovie(widget.movie);
                } else {
                  await  movieProvider.deleteMovie(widget.movie);

                }
                await movieProvider.saveBoolValue(widget.movie.id.toString(), !isSaved);

              },
              child: ImageIcon(
                AssetImage(isSaved ? ConstantImages.savedIcon : ConstantImages.addIcon),
                color: isSaved ? ColorsPalette.selectedColor : ColorsPalette.saveIconColor,
                size: 30.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

}