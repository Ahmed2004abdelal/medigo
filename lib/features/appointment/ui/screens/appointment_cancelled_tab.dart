import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/features/appointment/logic/appointment_state.dart';
import 'package:medigo/features/appointment/ui/widgets/appointment_card_list.dart';

import '../../logic/appointment_cubit.dart';

class AppointmentCancelledTab extends StatefulWidget {
  const AppointmentCancelledTab({super.key});

  @override
  State<AppointmentCancelledTab> createState() =>
      _AppointmentCancelledTabState();
}

class _AppointmentCancelledTabState extends State<AppointmentCancelledTab> {
  @override
  initState() {
    if (context.read<AppointmentCubit>().state.cancelledAppointments.isEmpty) {
      context.read<AppointmentCubit>().loadAppointments(
        AppointmentFilter.cancelled,
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
              state: States.cancelled,
              status: state.cancelledStatus,
              appointments: state.cancelledAppointments,
              errorMessage: state.cancelledError,
              emptyMessage: 'No cancelled appointments',
            ),
          ),
        ),
      ),
    );
  }
}
