import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_text_style.dart';
import 'appointment_cancelled_tab.dart';
import 'appointment_completed_tab.dart';
import 'appointment_upcoming_tab.dart';

import '../../../../core/theming/app_colors.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.h),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: TabBar(
              dividerColor: AppColors.lighterGrey,
              indicatorColor: AppColors.britnessBlue,
              indicatorWeight: 3.w,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 16.w),
              indicatorSize: TabBarIndicatorSize.values[0],
              labelStyle: AppTextStyle.font14BritnessBlue600,
              unselectedLabelStyle: AppTextStyle.font14Black500,
              controller: _tabController,
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          AppointmentUpcomingTab(),
          AppointmentCompletedTab(),
          AppointmentCancelledTab(),
        ],
      ),
    );
  }
}
