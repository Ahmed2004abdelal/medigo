import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets.dart';


class ImageCover extends StatelessWidget {
  const ImageCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      height: 150.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: Image.asset(
        Assets.imagesCover,
        width: double.infinity,
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
      ),
    );
  }
}



