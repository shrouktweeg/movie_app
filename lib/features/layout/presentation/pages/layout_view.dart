import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/core/config/constants.dart';
import 'package:movie_app/features/browse/presentation/manager/browse_cubit.dart';
import 'package:movie_app/features/browse/presentation/pages/browse_view.dart';
import 'package:movie_app/features/home/presentation/pages/home_view.dart';
import 'package:movie_app/features/search/presentation/manager/search_cubit.dart';
import 'package:movie_app/features/search/presentation/pages/search_view.dart';
import 'package:movie_app/features/watchList/presentation/pages/watch_list_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screensList = [
    const HomeView(),
    BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(""),
      child: const SearchView(),
    ),
    BlocProvider<BrowseCubit>(
      create: (context) => BrowseCubit(),
      child: const BrowseView(),
    ),
    const WatchListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Browse'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Watch List'),
        ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            List<ConnectivityResult> connectivity,
            Widget child,) {
          final bool connected = !connectivity.contains(
              ConnectivityResult.none);
          if (connected) {
            return screensList[currentIndex];
          } else {
            return buildNotInternet();
          }
        },
        child: Center(
          child: CircularProgressIndicator(color: ColorsPalette.iconsColor),
        ),
      ),
    );
  }

  Widget buildNotInternet() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(
          'No internet connection',
          style: TextStyle(
              fontSize: 15.sp, color: const Color(0XFF818181), fontFamily: 'Poppins'),
        ),
         SizedBox(height: 30.sp),
        Image.asset(ConstantImages.noInternetConnection),
         SizedBox(height: 15.sp),
         Center(
          child: Text(
            'Please check your connection\n again, or connect to Wi-Fi',
            style: TextStyle(
                fontSize: 15.sp, color: const Color(0XFF818181), fontFamily: 'Poppins'),
          ),
        ),
         SizedBox(height: 25.sp),
        ElevatedButton (
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsPalette.selectedColor,
            fixedSize:  Size(180.sp, 20.sp),
          ),
          onPressed: ()async {
            await AppSettings.openWIFISettings();
          },
          child:  Text(
            'Go to Setting',
            style: TextStyle(
                fontSize: 15.sp, color: Colors.white, fontFamily: 'Poppins'),
          ),
        ),
      ],
    );
  }

}