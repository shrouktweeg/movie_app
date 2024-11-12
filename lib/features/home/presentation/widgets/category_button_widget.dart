import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors_palette.dart';

class CategoryButton extends StatelessWidget {
  final String category;
  const CategoryButton({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Padding(
      padding:  EdgeInsets.all(8.0.sp),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          width: 120.w,
          height: 25.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color:ColorsPalette.borderColor
              ),
              top: BorderSide(
                  color:ColorsPalette.borderColor
              ),
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child:Center(child: Text(category,style:theme.textTheme.bodySmall!.copyWith(color: const Color(0XFFCBCBCB)),)),
        ),
      ),
    );
  }
}

