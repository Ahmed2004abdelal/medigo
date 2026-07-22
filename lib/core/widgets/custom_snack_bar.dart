import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_text_style.dart';

class CustomSnackBar extends StatelessWidget {
  final String text;
  final Color color;
  const CustomSnackBar({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.fromLTRB(8.0.w, 0.h, 8.0.w, 8.0.h),
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: AppTextStyle.font13Black400),
    );
  }
}
