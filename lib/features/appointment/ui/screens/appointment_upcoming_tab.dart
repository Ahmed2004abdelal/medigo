import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/features/appointment/logic/appointment_cubit.dart';
import 'package:medigo/features/appointment/logic/appointment_state.dart';
import 'package:medigo/features/appointment/ui/widgets/appointment_card_list.dart';

class AppointmentUpcomingTab extends StatefulWidget {
  const AppointmentUpcomingTab({super.key});

  @override
  State<AppointmentUpcomingTab> createState() => _AppointmentUpcomingTabState();
}

class _AppointmentUpcomingTabState extends State<AppointmentUpcomingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.0.h),
        child: SizedBox(
          height: double.infinity.h,
          width: double.infinity,
          child: BlocBuilder<AppointmentCubit, AppointmentState>(
  builder: (context, state) => AppointmentCardList(
    state: States.upcoming,
    status: state.upcomingStatus,
    appointments: state.upcomingAppointments,
    errorMessage: state.upcomingError,
    emptyMessage: 'No upcoming appointments',
  ),
),
        ),
      ),
    );
  }
}

