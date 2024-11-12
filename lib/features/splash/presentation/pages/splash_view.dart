
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/core/config/constants.dart';
import 'package:movie_app/core/config/page_routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
Timer(const Duration(seconds:5),()=>Navigator.pushReplacementNamed(context, PageRoutesName.layout));
super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ColorsPalette.primaryColor,
        ),
        child: Center(
          child: Image.asset(Constants.logoPic),
        ),
      ),
    );
  }
}
