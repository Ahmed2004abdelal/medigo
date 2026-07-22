import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medigo/core/helpers/spacing.dart';
import 'package:medigo/features/home/ui/screens/doctor_details_screen.dart';

class NewAppointmentScreen extends StatelessWidget {
  const NewAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 6.h,
          ),
          child: Column(
            children: [
              AppBarDetails(title: 'New Appointment', suffix: false),
              verticalSpace(34),
              
            ],
          ),
        ),
      ),
    );
  }
}
