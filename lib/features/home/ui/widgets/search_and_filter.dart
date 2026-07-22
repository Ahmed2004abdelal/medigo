import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 270.w,
          child: CustomTextFormField(
            controller: TextEditingController(),
            prefix: Container(
              margin: EdgeInsets.all(10.w),
              child: SvgPicture.asset(Assets.imagesIconesSearch),
            ),
            hintStyle: AppTextStyle.font14LightGrey400,
            hintText: loc(context)!.findtherightdoctorforyou,
          ),
        ),
        horizontalSpace(8),
        Container(
          margin: EdgeInsets.only(top: 12.h),
          width: 53.w,
          height: 59.h,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.blue,
          ),
          child: SvgPicture.asset(Assets.imagesIconesFilter),
        ),
      ],
    );
  }
}