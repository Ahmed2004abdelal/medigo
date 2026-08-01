import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/constants/assets.dart';
import 'package:medigo/core/helpers/spacing.dart';
import 'package:medigo/core/theming/app_colors.dart';
import 'package:medigo/core/theming/app_text_style.dart';
import 'package:medigo/core/widgets/search_and_filter.dart';
import 'package:medigo/features/home/ui/screens/doctor_details_screen.dart';
import 'package:medigo/features/search/data/model/doctor_model.dart';
import 'package:medigo/features/search/logic/search_cubit.dart';

import '../logic/search_state.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  final String? searchQuery;
  final String? logo;
  const SearchScreen({super.key, required this.logo, this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().fetchDoctors(
      searchQuery: widget.searchQuery ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 12.0.h),
            child: Column(
              children: [
                CustomAppbarDetails(
                  title: widget.searchQuery ?? 'Doctor',
                  suffix: true,
                  style: AppTextStyle.font16Grey400,
                  suffixWidget: SvgPicture.asset(
                    widget.logo ?? Assets.imagesIconesMale,
                    width: 20.w,
                    height: 25.h,
                  ),
                ),
                verticalSpace(27),
                SearchAndFilter(
                  controller: context.read<SearchCubit>().searchController,
                ),
                verticalSpace(20),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => SizedBox.shrink(),
                      error: (error) => Center(
                        child: Text(error, style: AppTextStyle.font16Grey400),
                      ),
                      loaded:
                          (
                            doctors,
                            hasNextPage,
                            searchQuery,
                            isLoadingMore,
                            currentSort,
                          ) {
                            return SortByAndFounded(
                              filteredDoctors: doctors,
                              searchQuery: searchQuery,
                            );
                          },
                    );
                  },
                ),
                verticalSpace(20),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => SizedBox.shrink(),
                      error: (error) => Center(
                        child: Text(error, style: AppTextStyle.font16Grey400),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.britnessBlue,
                        ),
                      ),
                      loaded:
                          (
                            doctors,
                            hasNextPage,
                            searchQuery,
                            isLoadingMore,
                            currentSort,
                          ) {
                            return Expanded(
                              child: ListView.builder(
                                itemCount:
                                    doctors.length + (hasNextPage ? 1 : 0),
                                itemBuilder: (context, index) {
                                  if (index < doctors.length) {
                                    final doctor = doctors[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DoctorDetailsScreen(
                                                  doctor: doctor,
                                                ),
                                          ),
                                        );
                                      },
                                      child: DoctorDetailsDisplay(
                                        doctor: doctor,
                                      ),
                                    );
                                  } else {
                                    context.read<SearchCubit>().loadMore();
                                    return Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16.h,
                                        ),
                                        child: CircularProgressIndicator(
                                          color: AppColors.britnessBlue,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorDetailsDisplay extends StatelessWidget {
  final DoctorModel? doctor;
  const DoctorDetailsDisplay({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 23.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey.withAlpha(400),
            spreadRadius: .2,
            blurRadius: 2,
            offset: const Offset(10, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(7.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7.r)),
            ),
            child: Image.network(
              doctor!.imageUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.fill,
            ),
          ),
          horizontalSpace(10),
          SizedBox(
            height: 80.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor!.name, style: AppTextStyle.font14Black600),
                Text(doctor!.specialty, style: AppTextStyle.font14Grey400),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.imagesIconesStar,
                      width: 15.w,
                      height: 15.h,
                    ),
                    horizontalSpace(5),
                    Text(
                      doctor!.rating.toStringAsFixed(1),
                      style: AppTextStyle.font12Black500,
                    ),
                    Text(
                      ' (${doctor!.reviewsCount} Reviews)',
                      style: AppTextStyle.font12Grey400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  Assets.imagesIconesHeart,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              verticalSpace(28),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$${doctor!.pricePerHour.toStringAsFixed(2)}",
                      style: AppTextStyle.font14Blue500,
                    ),
                    TextSpan(text: '/hr', style: AppTextStyle.font10Blue400),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SortByAndFounded extends StatelessWidget {
  const SortByAndFounded({
    super.key,
    required this.filteredDoctors,
    required this.searchQuery,
  });

  final List<DoctorModel> filteredDoctors;
  final String? searchQuery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${filteredDoctors.length} Founded for ",
                style: AppTextStyle.font14Grey400,
              ),
              TextSpan(
                text: "“${searchQuery ?? 'Doctor'}”",
                style: AppTextStyle.font14Grey600,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            // showModalBottomSheet(
            //   context: context,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
            //   ),
            //   builder: (bottomSheetContext) => BlocProvider.value(
            //     value: context.read<SearchCubit>(),
            //     child: const SortByBottomSheet(),
            //   ),
            // );
          },
          child: Row(
            children: [
              Text("Sort by", style: AppTextStyle.font14Blue500),
              horizontalSpace(10),
              SvgPicture.asset(
                Assets.imagesIconesSort,
                width: 14.w,
                height: 12.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class SortByBottomSheet extends StatefulWidget {
//   const SortByBottomSheet({super.key});

//   @override
//   State<SortByBottomSheet> createState() => _SortByBottomSheetState();
// }

// class _SortByBottomSheetState extends State<SortByBottomSheet> {
//   String? selectedValue;

//   @override
//   initState() {
//     super.initState();
//     selectedValue = context.read<SearchCubit>().state.currentSort;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25.r),
//           topRight: Radius.circular(25.r),
//         ),
//       ),
//       height: 383.h,
//       child: Column(
//         children: [
//           Text("Sort by", style: AppTextStyle.font18Black900),
//           Divider(color: AppColors.lightGrey, thickness: 1.h),
//           Expanded(
//             child: Material(
//               type: MaterialType.transparency,
//               child: Theme(
//                 data: Theme.of(context).copyWith(
//                   splashFactory: NoSplash.splashFactory,
//                   highlightColor: Colors.transparent,
//                   splashColor: Colors.transparent,
//                 ),
//                 child: ListView.builder(
//                   itemExtent: 38.h,
//                   itemCount: sortByFilters.length,
//                   itemBuilder: (context, index) {
//                     final filter = sortByFilters[index];
//                     return CheckboxListTile(
//                       value: selectedValue == filter.value,
//                       onChanged: (checked) {
//                         setState(() {
//                           if (checked == true) {
//                             selectedValue = filter.value;
//                           } else {
//                             selectedValue = null;
//                           }
//                         });
//                       },
//                       horizontalTitleGap: 0,
//                       title: Text(
//                         filter.name,
//                         style: AppTextStyle.font14Grey600,
//                       ),
//                       controlAffinity: ListTileControlAffinity.leading,
//                       activeColor: AppColors.blue,
//                       contentPadding: EdgeInsets.zero,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100.r),
//                       ),
//                       side: BorderSide(color: AppColors.blue, width: 1.w),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomButton(
//                 text: 'Clear',
//                 textStyle: AppTextStyle.font16BritnessBlue600,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(100.r),
//                   side: BorderSide(width: 2.0.w, color: AppColors.britnessBlue),
//                 ),
//                 backgroundColor: AppColors.babyBlue,
//                 size: Size(155.w, 45.h),
//                 onPressed: () {
//                   context.read<SearchCubit>().changeSort(null);
//                 },
//               ),
//               CustomButton(
//                 text: "Filter",
//                 textStyle: AppTextStyle.font16White600,
//                 backgroundColor: AppColors.britnessBlue,
//                 size: Size(155.w, 45.h),
//                 onPressed: () {
//                   context.read<SearchCubit>().changeSort(selectedValue);
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
