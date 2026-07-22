import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../../l10n/app_localizations.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
    {
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)!.hello,
                    style: AppTextStyle.font18Black400,
                  ),
                  TextSpan(
                    text: ' Ahmed Abdelaal',
                    style: AppTextStyle.font18Black600,
                  ),
                ],
              ),
            ),
            Text(loc(context)!.goodmorning, style: AppTextStyle.font14Grey500),
          ],
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100.r),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10.0.w),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 30,
              weight: .5,
            ),
          ),
        ),
      ],
    );
  }
}
