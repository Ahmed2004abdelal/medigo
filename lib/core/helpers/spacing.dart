import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../l10n/app_localizations.dart';

SizedBox horizontalSpace(double width) => SizedBox(width: width.w);
SizedBox verticalSpace(double height) => SizedBox(height: height.h);

AppLocalizations? loc(BuildContext context) => AppLocalizations.of(context);
