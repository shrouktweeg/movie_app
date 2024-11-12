import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/page_routes_name.dart';
import 'package:movie_app/features/browse/presentation/manager/browse_cubit.dart';
import 'package:movie_app/features/browse/presentation/pages/browse_view.dart';
import 'package:movie_app/features/browse/presentation/pages/browse_view_details.dart';
import 'package:movie_app/features/home/presentation/manager/home_cubit.dart';
import 'package:movie_app/features/home/presentation/pages/home_view.dart';
import 'package:movie_app/features/home/presentation/pages/movie_details_view.dart';
import 'package:movie_app/features/layout/presentation/pages/layout_view.dart';
import 'package:movie_app/features/search/presentation/pages/search_view.dart';
import 'package:movie_app/features/splash/presentation/pages/splash_view.dart';
import 'package:movie_app/features/watchList/presentation/pages/watch_list_view.dart';


class AppRouter{
 static Route<dynamic> onGenerate(RouteSettings settings){
   switch(settings.name){
     case PageRoutesName.initial:
       return MaterialPageRoute(builder: (context)=>const SplashView(),settings: settings);
     case PageRoutesName.layout:
       return MaterialPageRoute(builder: (_)=> BlocProvider<HomeCubit>(
  create: (_) => HomeCubit(),
  child: const LayoutView(),
),settings: settings);
       case PageRoutesName.home:
       return MaterialPageRoute(builder: (_)=>const HomeView(),settings: settings);
     case PageRoutesName.search:
       return MaterialPageRoute(builder: (_)=>const SearchView(),settings: settings);
     case PageRoutesName.browse:
       return MaterialPageRoute(builder: (_)=>const BrowseView(),settings: settings);
     case PageRoutesName.browseDetails:
       return MaterialPageRoute(builder: (_)=>BlocProvider<BrowseCubit>(
         create: (_)=>BrowseCubit(),
           child: const BrowseViewDetails()),settings: settings);

     case PageRoutesName.watchList:
       return MaterialPageRoute(builder: (_)=>const WatchListView(),settings: settings);
     case PageRoutesName.movieDetails:
       return MaterialPageRoute(builder: (_)=> const MovieDetailsView(),settings: settings);
     default:
       return MaterialPageRoute(builder: (_)=>const SplashView(),settings: settings);


   }

  }
}