import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_text_style.dart';

class AuthSwitchButton extends StatelessWidget {
  final String actionText;
  final String text;
  final void Function() onPressed;
  const AuthSwitchButton({super.key, required this.text, required this.actionText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.font13Black400,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsetsDirectional.only(start: 3.w),
            minimumSize: Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onPressed ,
          child: Text(actionText, style: AppTextStyle.font13BritnessBlue600),
        ),
      ],
    );
  }
}
