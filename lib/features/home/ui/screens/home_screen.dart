import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/home_cubit/home_cubit.dart';
import '../widgets/doctors_list_view.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/image_cover.dart';
import '../../../../core/widgets/search_and_filter.dart';
import '../widgets/see_all_button.dart';
import '../widgets/specialties_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 20.w,
              vertical: 8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                verticalSpace(10),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.search);
                  },
                  child: SearchAndFilter(isEnabled: false),
                ),
                verticalSpace(25),
                ImageCover(),
                verticalSpace(25),
                verticalSpace(25),
                SeeAllButton(
                  title: loc(context)!.doctorspecialties,
                  onPressed: () {},
                ),
                verticalSpace(25),
                SpecialtiesList(),
                verticalSpace(25),
                SeeAllButton(
                  title: loc(context)!.availabledoctors,
                  onPressed: () => seeAll(context),
                ),
                verticalSpace(25),
                DoctorsListView(),
                verticalSpace(250),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void seeAll(BuildContext context) {
  context.read<HomeCubit>().loadMore();
}
