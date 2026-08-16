import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/features/appointment/logic/appointment_state.dart';
import 'package:medigo/features/appointment/ui/widgets/appointment_card_list.dart';

import '../../logic/appointment_cubit.dart';

class AppointmentCompletedTab extends StatefulWidget {
  const AppointmentCompletedTab({super.key});

  @override
  State<AppointmentCompletedTab> createState() =>
      _AppointmentCompletedTabState();
}

class _AppointmentCompletedTabState extends State<AppointmentCompletedTab> {
  @override
  void initState() {
    if (context.read<AppointmentCubit>().state.completedAppointments.isEmpty) {
      context.read<AppointmentCubit>().loadAppointments(
        AppointmentFilter.completed,
      );
    }
    super.initState();
  }

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
              state: States.completed,
              status: state.completedStatus,
              appointments: state.completedAppointments,
              errorMessage: state.completedError,
              emptyMessage: 'No completed appointments',
            ),
          ),
        ),
      ),
    );
  }
}
