import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/assets.dart';
import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_style.dart';
import 'custom_text_form_field.dart';

class SearchAndFilter extends StatelessWidget {

  const SearchAndFilter({super.key, this.onFilterTap, this.controller,this.isEnabled});
  final bool? isEnabled;
  final VoidCallback? onFilterTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomTextFormField(
              isEnabled: isEnabled?? true,
              controller: controller ?? TextEditingController(),
              prefix: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SvgPicture.asset(
                  Assets.imagesIconesSearch,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              hintStyle: AppTextStyle.font14LightGrey400,
              hintText: loc(context)!.findtherightdoctorforyou,
              // : InputBorder.none,
            ),
          ),
          horizontalSpace(10),
          InkWell(
            onTap: onFilterTap,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              width: 52.w,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.blue,
              ),
              child: SvgPicture.asset(
                Assets.imagesIconesFilter,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
