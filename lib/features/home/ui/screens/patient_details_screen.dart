import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/new_appointment_cubit/new_appointment_cubit.dart';
import 'doctor_details_screen.dart';

import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../../core/widgets/custom_floating_action_button.dart';
import '../../data/models/appointment_model.dart';
import '../../logic/new_appointment_cubit/new_appointment_state.dart';

// ignore: must_be_immutable
class PatientDetailsScreen extends StatelessWidget {
  PatientDetailsScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _detailController = TextEditingController();

  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonBlocBuilder(formKey: formKey),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: BlocBuilder<NewAppointmentCubit, NewAppointmentState>(
            builder: (context, state) {
              final cubit = context.read<NewAppointmentCubit>();
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppbarDetails(
                        title: 'Patient\'s Details',
                        onTap: () {
                          context.pop();
                        },
                        suffix: false,
                      ),
                      verticalSpace(25),
                      CustomTextFormField(
                        controller: _fullNameController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter patient full name';
                          }
                          return null;
                        },
                        outLable: 'Full Name',
                        hintText: 'User',
                        keyboardType: TextInputType.name,
                        onchanged: (val) {
                          val.isNotEmpty ? cubit.setFullName(val) : null;
                        },
                      ),
                      verticalSpace(25),
                      CustomTextFormField(
                        controller: _emailController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter patient email';
                          }
                          return null;
                        },
                        outLable: 'Email',
                        hintText: 'user@mail.com',
                        keyboardType: TextInputType.emailAddress,
                        onchanged: (val) {
                          val.isNotEmpty ? cubit.setEmail(val) : null;
                        },
                      ),
                      verticalSpace(25),
                      CustomTextFormField(
                        controller: _phoneController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter patient phone number';
                          }
                          return null;
                        },
                        outLable: 'Phone number',
                        hintText: '+20 000 000 0000',
                        keyboardType: TextInputType.phone,
                        onchanged: (val) {
                          val.isNotEmpty ? cubit.setPhone(val) : null;
                        },
                      ),
                      verticalSpace(25),
                      CustomDropdownFormField<Gender>(
                        outLable: 'Gender',
                        hintText: "Choose patient's gender",
                        hinttextStyle: AppTextStyle.font14LightGrey400,
                        items: Gender.values,
                        itemLabel: (gender) =>
                            gender.name[0].toUpperCase() +
                            gender.name.substring(1),
                        value: _selectedGender,
                        onChanged: (val) =>
                            val != null ? cubit.setSelectedGender(val) : null,
                        validator: (value) =>
                            value == null ? 'Please select gender' : null,
                      ),
                      verticalSpace(25),
                      CustomTextFormField(
                        controller: _ageController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter patient age';
                          }
                          return null;
                        },
                        outLable: 'Age',
                        hintText: 'Patient age',
                        keyboardType: TextInputType.number,
                        onchanged: (val) {
                          val.isNotEmpty ? cubit.setAge(val) : null;
                        },
                      ),
                      verticalSpace(25),
                      CustomTextFormField(
                        controller: _detailController,
                        // validator: (val) {
                        //   if (val == null || val.isEmpty) {
                        //     return 'Please enter patient details';
                        //   }
                        //   return null;
                        // },
                        outLable: 'Detail',
                        hintText: 'Patient details',
                        height: 152.h,
                        minLines: 5,
                        keyboardType: TextInputType.multiline,
                        onchanged: (val) {
                          val.isNotEmpty ? cubit.setDetail(val) : null;
                        },
                      ),
                      verticalSpace(100),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomDropdownFormField<T> extends StatelessWidget {
  final String? outLable;
  final String hintText;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final TextStyle? hinttextStyle;

  const CustomDropdownFormField({
    super.key,
    required this.hintText,
    required this.items,
    required this.itemLabel,
    this.outLable,
    this.hinttextStyle,
    this.value,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (outLable != null) ...[
          Text(outLable!, style: AppTextStyle.font14Black500),
          verticalSpace(15),
        ],
        DropdownButtonFormField<T>(
          initialValue: value,
          style: AppTextStyle.font14Black500,
          icon: const Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          isDense: true,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(itemLabel(item), style: AppTextStyle.font14Black500),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: hinttextStyle ?? AppTextStyle.font14LightGrey400,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColors.lightGrey,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColors.blue,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonBlocBuilder extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  const ButtonBlocBuilder({super.key, required this._formKey});

  void _submit(BuildContext context) {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final cubit = context.read<NewAppointmentCubit>();

    if (cubit.secondDone) {
      cubit.bookAppointment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewAppointmentCubit, NewAppointmentState>(
      listener: (context, state) {
        if (state.submissionStatus == SubmissionStatus.success) {
          context.pushNamed(
            Routes.appointmentSuccessScreen,
            arguments: context.read<NewAppointmentCubit>(),
          );
        } else if (state.submissionStatus == SubmissionStatus.failure) {
          debugPrint('------------------------------------------------');
          debugPrint('BOOKING FAILED: ${state.submissionErrorMessage}');
          debugPrint('------------------------------------------------');
          showDialog(
            context: context,
            builder: (_) => Dialog(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error, color: Colors.red),
                    verticalSpace(16),
                    const Text('Failed to book appointment.'),
                    verticalSpace(16),
                    ElevatedButton(
                      onPressed: () => context.pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.submissionStatus == SubmissionStatus.loading;

        return CustomFloatingActionButton(
          title: isLoading ? null : 'Book Appointment',
          onPressed: isLoading ? null : () => _submit(context),
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : null,
        );
      },
    );
  }
}
