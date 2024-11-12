import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/core/config/constants.dart';
import 'package:movie_app/core/config/page_routes_name.dart';
import 'package:movie_app/features/browse/domain/entities/browse-entity.dart';
import 'package:movie_app/features/browse/presentation/manager/browse_cubit.dart';
import 'package:movie_app/features/browse/presentation/widgets/movies_categories_widget.dart';
import 'package:movie_app/features/home/presentation/manager/home_state.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  List<BrowseEntity> browseList = [];
  List<String>imagesList=[
    ConstantImages.action,
    ConstantImages.adventure,
    ConstantImages.animation,
    ConstantImages.comedy,
    ConstantImages.crime,
    ConstantImages.documentary,
    ConstantImages.drama,
    ConstantImages.family,
    ConstantImages.fantasy,
    ConstantImages.history,
    ConstantImages.horror,
    ConstantImages.music,
    ConstantImages.mystery,
    ConstantImages.romance,
    ConstantImages.scienceFiction,
    ConstantImages.tvMovie,
    ConstantImages.thriller,
    ConstantImages.war,
    ConstantImages.western,
  ];


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsPalette.primaryColor,
          elevation: 0.sp,
          title: Text(
            'Browse Category ', style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 22.sp,
          ),),
        ),
        body: BlocBuilder<BrowseCubit, HomeState>(
          builder: (context, state) {
            browseList=context.read<BrowseCubit>().browsedList;
            if(state is SuccessState){
              return GridView.builder(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 40.0.sp,
                    crossAxisSpacing: 10.0.sp,
                    childAspectRatio: 2.sp
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: browseList.length, // total number of items
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutesName.browseDetails,);
                    },
                    child:  MoviesCategories(browseMovie: browseList[index].name,image: imagesList[index],),
                  );
                },
              );
            }
            else if(state is InitialState){
              return Center(
                child: CircularProgressIndicator(
                  color: ColorsPalette.iconsColor,
                ),
              );
            }
            else if (state is ErrorState) {
              return Center(child: Text('Error: ${state.toString()}'));
            }
            return Container();
          },
        )
    );
  }
}

