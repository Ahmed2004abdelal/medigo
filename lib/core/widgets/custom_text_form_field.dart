import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final String? outLable;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onchanged;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool? isEnabled;
  final int? maxLines;
  final int? minLines;
  final double? height;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.outLable,
    this.isEnabled,
    this.hintStyle,
    this.textInputAction,
    this.suffixIcon,
    this.focusNode,
    this.obscureText,
    this.keyboardType,
    this.onchanged,
    this.validator,
    this.onFieldSubmitted,
    this.prefix,
    this.maxLines,
    this.minLines,
    this.height,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscureText;
  @override
  void initState() {
    super.initState();
    _isObscureText = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.outLable != null
            ? Text(widget.outLable!, style: AppTextStyle.font14Black500)
            : SizedBox(height: 0.h, width: 0.w),
        widget.outLable != null ? verticalSpace(15) : const SizedBox.shrink(),
        SizedBox(
          height: widget.height,
          child: TextFormField(
            style: AppTextStyle.font14Black500,
            enabled: widget.isEnabled ?? true,
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            validator: widget.validator,
            controller: widget.controller,
            focusNode: widget.focusNode,
            obscureText: _isObscureText,
            onChanged: widget.onchanged,
            keyboardType: widget.keyboardType,
            maxLines: widget.obscureText == true ? 1 : widget.maxLines,
            minLines: widget.minLines,
            textAlignVertical: TextAlignVertical.top,
            enableSuggestions: false,
            autocorrect: false,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              suffixIcon: widget.obscureText == true
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                      icon: Icon(
                        _isObscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.black,
                      ),
                    )
                  : widget.suffixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: AppColors.lightGrey,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: AppColors.blue,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ?? AppTextStyle.font14LightGrey400,
              prefixIcon: widget.prefix,
            ),
          ),
        ),
      ],
    );
  }
}
