import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/assets.dart';
import '../helpers/extension.dart';
import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_style.dart';

class CustomAppbarDetails extends StatelessWidget {
  final String title;
  final bool? suffix;
  final void Function()? onTap;
  const CustomAppbarDetails({
    super.key,
    required this.title,
    this.suffix = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey[200]!),
              borderRadius: BorderRadiusGeometry.circular(5.r),
            ),
            child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
          ),
        ),
        horizontalSpace(16),
        Text(title, style: AppTextStyle.font14Black600),
        Spacer(),
        suffix!
            ? GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  Assets.imagesIconesHeart,
                  width: 20.w,
                  height: 17.h,
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
