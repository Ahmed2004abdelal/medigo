import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';


class OrContinueWith extends StatelessWidget {
  const OrContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Divider(color: AppColors.lightGrey, thickness: 1.5.w),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            AppLocalizations.of(context)!.orContinueWith,
            style: AppTextStyle.font14LightGrey400,
          ),
        ),
      ],
    );
  }
}

