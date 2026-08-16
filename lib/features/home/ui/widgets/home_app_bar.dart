import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../../l10n/app_localizations.dart';
import '../../logic/home_cubit/home_cubit.dart';
import '../../logic/home_cubit/home_state.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameCubitListener(),
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

class NameCubitListener extends StatelessWidget {
  const NameCubitListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.userName != current.userName,
      builder: (context, state) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.hello,
                style: AppTextStyle.font18Black400,
              ),
              TextSpan(
                text: state.userName.isEmpty ? ' ...' : ' ${state.userName}',
                style: AppTextStyle.font18Black600,
              ),
            ],
          ),
        );
      },
    );
  }
}
