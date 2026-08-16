import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'core/theming/app_colors.dart';
import 'data/dummy.dart';

class BottomNavBar extends StatefulWidget {
  final int? selectedIndex;
  const BottomNavBar({super.key, this.selectedIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int currentPage;

  @override
  void initState() {
    currentPage = widget.selectedIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: IndexedStack(
        index: currentPage,
        children: bottomNavigationItems.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey[400]!, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        height: 60.h,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: currentPage,
          onTap: (value) => setState(() {
            currentPage = value;
          }),
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                bottomNavigationItems[0].icon,
                width: 18.w,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  currentPage == 0
                      ? AppColors.britnessBlue
                      : AppColors.lighterBabyBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                bottomNavigationItems[1].icon,
                width: 18.w,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  currentPage == 1
                      ? AppColors.britnessBlue
                      : AppColors.lighterBabyBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                bottomNavigationItems[2].icon,
                width: 18.w,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  currentPage == 2
                      ? AppColors.britnessBlue
                      : AppColors.lighterBabyBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                bottomNavigationItems[3].icon,
                width: 18.w,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  currentPage == 3
                      ? AppColors.britnessBlue
                      : AppColors.lighterBabyBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
