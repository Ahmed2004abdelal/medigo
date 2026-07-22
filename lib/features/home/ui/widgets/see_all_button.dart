import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_style.dart';



class SeeAllButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const SeeAllButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.font14Black600),
        TextButton(
          onPressed: onPressed,
          child: Text(
            loc(context)!.seeall,
            style: AppTextStyle.font13BritnessBlue400,
          ),
        ),
      ],
    );
  }
}