import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/config/app_router.dart';
import 'package:movie_app/core/config/application_theme.dart';
import 'package:movie_app/core/config/page_routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/watchList/presentation/provider/movie_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
          create: (context)=>MovieProvider(),
          child:const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(412, 892),
      child: MaterialApp(
        title: 'Movie App',
        theme: ApplicationThemeManager.themeData,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerate,
        initialRoute: PageRoutesName.initial,
      ),
    );
  }
}



