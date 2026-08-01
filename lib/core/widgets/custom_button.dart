import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_style.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  void Function()? onPressed;
    final Widget? child;      
  final Size? size;
  CustomButton({
    super.key,
    this.text,
    this.child,
    this.size,
    this.backgroundColor,
    this.onPressed,
    this.shape,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: shape,
        backgroundColor: backgroundColor ?? AppColors.britnessBlue,
        minimumSize: size ?? Size(double.infinity, 45.h),
      ),
      onPressed: onPressed,
      child: child ?? Text(text ?? '', style: textStyle ?? AppTextStyle.font16White600),
    );
  }
}
