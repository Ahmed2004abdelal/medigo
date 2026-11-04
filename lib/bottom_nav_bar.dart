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
    // نبني الـ items هنا في كل build — عشان الـ pages تتعمل لها rebuild فعلي
    final items = buildBottomNavigationItems();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: IndexedStack(
        index: currentPage,
        children: items.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey[400]!, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        height: 76.h,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: currentPage,
          onTap: (value) => setState(() {
            currentPage = value;
          }),
          showSelectedLabels: false,
          items: List.generate(items.length, (index) {
            return BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                items[index].icon,
                width: 18.w,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  currentPage == index
                      ? AppColors.britnessBlue
                      : AppColors.lighterBabyBlue,
                  BlendMode.srcIn,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
