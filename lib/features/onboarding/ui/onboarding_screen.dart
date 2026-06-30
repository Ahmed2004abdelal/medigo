import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/core/helpers/spacing.dart';
import 'package:medigo/core/theming/app_text_style.dart';
import 'package:medigo/features/onboarding/data/onboarding_model.dart';
import 'package:medigo/features/onboarding/logic/cubit/onboarding_cubit.dart';
import 'package:medigo/features/onboarding/ui/widgets/navigation_buttons.dart';
import 'package:medigo/features/onboarding/ui/widgets/onboarding_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = context.read<OnboardingCubit>().pageController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardinState>(
        listener: (context, state) {
          if (_pageController.hasClients &&
              _pageController.page?.round() != state.index) {
            _pageController.animateToPage(
              state.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: onboardingItems.length,
            itemBuilder: (context, index) {
              final item = onboardingItems[index];
              final isFirst = cubit.isFirstPage();
              final isLast = cubit.isLastPage(onboardingItems.length);
              return Stack(
                children: [
                  Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 364.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22.0.w,
                          vertical: 54.0.h,
                        ),
                        child: Column(
                          children: [
                            Text(
                              item.title,
                              style: AppTextStyle.font22Black600,
                            ),
                            verticalSpace(15.h),
                            Text(
                              item.description,
                              style: AppTextStyle.font14Grey1400.copyWith(
                                height: 1.5.h,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            verticalSpace(35),
                            OnboardingIndicator(index: state.index),
                            verticalSpace(35),
                            NavigationButtons(
                              isFirst: isFirst,
                              cubit: cubit,
                              isLast: isLast,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}




