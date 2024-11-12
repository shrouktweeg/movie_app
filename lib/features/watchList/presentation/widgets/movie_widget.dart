import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/core/config/constants.dart';
import 'package:movie_app/core/config/page_routes_name.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';

class MovieShortWidget extends StatefulWidget {
  final List<PopularMoviesModel> searchedMoviesList;
  final bool isSaved;

  const MovieShortWidget(
      {super.key, required this.searchedMoviesList, required this.isSaved});

  @override
  State<MovieShortWidget> createState() => _MovieShortWidgetState();
}

class _MovieShortWidgetState extends State<MovieShortWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (widget.searchedMoviesList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: ColorsPalette.iconsColor,
        ),
      );
    } else {
      return ListView.builder(
          itemCount: widget.searchedMoviesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutesName.movieDetails,
                      arguments: widget.searchedMoviesList[index]);
                },
                child: Column(
                  children: [
                    widget.isSaved
                        ? Slidable(
                            startActionPane: ActionPane(
                              motion: const BehindMotion(),
                              extentRatio: 0.5.sp,
                              children: [
                                SlidableAction(
                                  padding: EdgeInsets.zero,
                                  onPressed: (context) async {
                                    final movieProvider =
                                        Provider.of<MovieProvider>(context,
                                            listen: false);

                                    movieProvider.deleteMovie(
                                        widget.searchedMoviesList[index]);
                                    movieProvider.saveBoolValue( widget.searchedMoviesList[index].id.toString(), false);
                                    setState(() {
                                      widget.searchedMoviesList.removeAt(index);
                                    });
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                  borderRadius:  BorderRadius.only(
                                    topLeft: Radius.circular(15.sp),
                                    bottomLeft: Radius.circular(15.sp),
                                  ),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  height: 110.sp,
                                  fit: BoxFit.fitHeight,
                                  imageUrl:
                                      "${Constants.imageDomain}${widget.searchedMoviesList[index].posterPath}",
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: ColorsPalette.iconsColor,
                                    ),
                                  ),
                                  errorWidget: (_, __, ___) => Icon(
                                    size: 80,
                                    Icons.image_not_supported,
                                    color: ColorsPalette.iconsColor,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.0.sp),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.searchedMoviesList[index]
                                              .originalTitle,
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 15.sp),
                                        ),
                                        Text(
                                          widget.searchedMoviesList[index]
                                              .releaseDate,
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 13.sp,
                                                  color: Colors.white
                                                      .withOpacity(0.67.sp)),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            widget.searchedMoviesList[index]
                                                .overView,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Row(
                            children: [
                              CachedNetworkImage(
                                height: 110.sp,
                                fit: BoxFit.fitHeight,
                                imageUrl:
                                    "${Constants.imageDomain}${widget.searchedMoviesList[index].posterPath}",
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: ColorsPalette.iconsColor,
                                  ),
                                ),
                                errorWidget: (_, __, ___) => Icon(
                                  size: 80.sp,
                                  Icons.image_not_supported,
                                  color: ColorsPalette.iconsColor,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.searchedMoviesList[index]
                                            .originalTitle,
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(fontSize: 15.sp),
                                      ),
                                      Text(
                                        widget.searchedMoviesList[index]
                                            .releaseDate,
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 13.sp,
                                                color: Colors.white
                                                    .withOpacity(0.67.sp)),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          widget.searchedMoviesList[index]
                                              .overView,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Divider(
                      color: ColorsPalette.dividerColor,
                      thickness: 1.sp,
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }
}
