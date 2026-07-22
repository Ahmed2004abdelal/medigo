import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {},
        child: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: AppTextStyle.font12Black400.copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 1.2.w,
          ),
        ),
      ),
    );
  }
}

