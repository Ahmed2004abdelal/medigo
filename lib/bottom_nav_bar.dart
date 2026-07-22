import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/data/dummy.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationItems[currentPage].page,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey[400]!, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        height: 60.h,
        child: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) => setState(() {
            currentPage = value;
          }),
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(bottomNavigationItems[0].icon),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                bottomNavigationItems[1].icon,
                width: 18.w,
                height: 18.h,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                bottomNavigationItems[2].icon,
                width: 18.w,
                height: 18.h,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                bottomNavigationItems[3].icon,
                width: 18.w,
                height: 18.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
