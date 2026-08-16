import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_style.dart';
import 'doctor_details_screen.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_floating_action_button.dart';
import '../../data/models/available_slots_model.dart';
import '../../data/models/consultation_fees_model.dart';
import '../../data/models/consultation_type_model.dart';
import '../../logic/new_appointment_cubit/new_appointment_cubit.dart';
import '../../logic/new_appointment_cubit/new_appointment_state.dart';

class NewAppointmentScreen extends StatelessWidget {
  const NewAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonBlocBuilder(),
      body: BlocBuilder<NewAppointmentCubit, NewAppointmentState>(
        builder: (context, state) {
          final cubit = context.read<NewAppointmentCubit>();
          return SafeArea(
            child: SingleChildScrollView(
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
                      title: 'New Appointment',
                      suffix: false,
                    ),
                    verticalSpace(34),
                    DateSelector(
                      initialDate: DateTime.now(),
                      onDateSelected: (date) {
                        cubit.setSelectedDate(date);
                      },
                    ),
                    verticalSpace(25),
                    Text(
                      'Consultation Type',
                      style: AppTextStyle.font14Black600,
                    ),
                    verticalSpace(20),
                    SizedBox(
                      height:
                          15 +
                          (consultationTypes.length / 2).round() *
                              (38.h + 13.h),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 13.h,
                          crossAxisSpacing: 13.w,
                          childAspectRatio: 140.w / 38.h,
                        ),
                        itemCount: consultationTypes.length,
                        itemBuilder: (context, index) {
                          final type = consultationTypes[index];
                          final isSelected =
                              context
                                  .read<NewAppointmentCubit>()
                                  .state
                                  .consultationType ==
                              type.title;
                          return GestureDetector(
                            onTap: () =>
                                cubit.setSelectedConsultationType(type.title),
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              width: 140.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.britnessBlue.withAlpha(255)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.blue
                                      : AppColors.lightGrey.withAlpha(102),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                spacing: 10.w,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    type.image,
                                    width: 16.w,
                                    height: 18.h,
                                  ),
                                  Text(
                                    type.title,
                                    style: AppTextStyle.font14Black400,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    verticalSpace(15),
                    Text('Available Slots', style: AppTextStyle.font14Black600),
                    verticalSpace(20),
                    Row(
                      spacing: 13.w,
                      children: List.generate(availabilityFilters.length, (
                        index,
                      ) {
                        final item = availabilityFilters[index];
                        final isSelected =
                            context
                                .read<NewAppointmentCubit>()
                                .state
                                .availableSlot ==
                            item.value;
                        return GestureDetector(
                          onTap: () =>
                              cubit.setSelectedAvailableSlot(item.value!),
                          child: Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.britnessBlue.withAlpha(255)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.blue
                                    : AppColors.lightGrey.withAlpha(102),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              spacing: 10.w,
                              children: [
                                Image.asset(
                                  item.image!,
                                  width: 18.w,
                                  height: 18.h,
                                ),
                                Text(
                                  item.name!,
                                  style: AppTextStyle.font14Black400,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    verticalSpace(20),
                    if (context
                        .read<NewAppointmentCubit>()
                        .state
                        .availableSlot
                        .isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available Time',
                            style: AppTextStyle.font14Black600,
                          ),
                          verticalSpace(20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 15.w,
                              children: List.generate(
                                availableTimesMap[context
                                            .read<NewAppointmentCubit>()
                                            .state
                                            .availableSlot]
                                        ?.length ??
                                    0,
                                (index) {
                                  final time =
                                      availableTimesMap[context
                                          .read<NewAppointmentCubit>()
                                          .state
                                          .availableSlot]![index];
                                  final isSelected =
                                      context
                                          .read<NewAppointmentCubit>()
                                          .state
                                          .selectedHour ==
                                      time.hour;
                                  return GestureDetector(
                                    onTap: () =>
                                        cubit.setSelectedHour(time.hour),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 7.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColors.britnessBlue.withAlpha(
                                                255,
                                              )
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColors.blue
                                              : AppColors.lightGrey.withAlpha(
                                                  102,
                                                ),
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        '${time.hour.toString().padLeft(2, '0')}:00',
                                        style: AppTextStyle.font12Grey500
                                            .copyWith(
                                              color: isSelected
                                                  ? Colors.white
                                                  : AppColors.grey,
                                            ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    verticalSpace(20),
                    if (context
                        .read<NewAppointmentCubit>()
                        .state
                        .consultationType
                        .isNotEmpty)
                      Builder(
                        builder: (context) {
                          final fees =
                              consultationFeesMap[context
                                  .read<NewAppointmentCubit>()
                                  .state
                                  .consultationType] ??
                              [];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Consultation Fees',
                                style: AppTextStyle.font14Black600,
                              ),
                              verticalSpace(20),
                              Center(
                                child: Row(
                                  mainAxisAlignment: fees.length > 1
                                      ? MainAxisAlignment.spaceBetween
                                      : MainAxisAlignment.center,
                                  children: List.generate(fees.length, (index) {
                                    final fee = fees[index];
                                    final isSelected =
                                        context
                                            .read<NewAppointmentCubit>()
                                            .state
                                            .consultationFee ==
                                        fee.cost;
                                    return GestureDetector(
                                      onTap: () =>
                                          cubit.setSelectedFee(fee.cost!),
                                      child: Container(
                                        height: 100.h,
                                        width: 100.w,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 15.5.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: isSelected
                                                ? AppColors.blue
                                                : AppColors.lightGrey.withAlpha(
                                                    102,
                                                  ),
                                            width: 1.5.w,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                              fee.icon!,
                                              width: 19.w,
                                              height: 18.h,
                                              colorFilter: ColorFilter.mode(
                                                AppColors.grey,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            Text(
                                              '${fee.name} ',
                                              style: AppTextStyle.font12Grey500,
                                            ),
                                            Text(
                                              '\$${fee.cost}',
                                              style:
                                                  AppTextStyle.font16Black700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    verticalSpace(90),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DateSelector extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDateSelected;

  const DateSelector({super.key, this.initialDate, this.onDateSelected});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime selectedDate;
  late DateTime displayedMonth;
  late List<DateTime> monthDates;

  static const List<String> _weekdayLabels = [
    'MON',
    'TUE',
    'WED',
    'THUR',
    'FRI',
    'SAT',
    'SUN',
  ];

  static const List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
    displayedMonth = DateTime(selectedDate.year, selectedDate.month);
    monthDates = _generateDatesForMonth(displayedMonth);

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
  }

  List<DateTime> _generateDatesForMonth(DateTime month) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    return List.generate(
      daysInMonth,
      (i) => DateTime(month.year, month.month, i + 1),
    );
  }

  void _scrollToSelected() {
    if (!_scrollController.hasClients) return;
    final index = monthDates.indexWhere((d) => _isSameDay(d, selectedDate));
    if (index == -1) return;
    const itemWidth = 65.0 + 10.0;
    final offset = (index * itemWidth) - 100;
    _scrollController.animateTo(
      offset.clamp(0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  void _selectDate(DateTime date) {
    setState(() => selectedDate = date);
    widget.onDateSelected?.call(date);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => _showMonthYearPicker(context),
              child: Row(
                children: [
                  Text(
                    '${_monthNames[displayedMonth.month - 1]}, ${displayedMonth.year}',
                    style: AppTextStyle.font14Black600,
                  ),
                  SizedBox(width: 4.w),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: monthDates.length,
            separatorBuilder: (_, i) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final date = monthDates[index];
              final isSelected = _isSameDay(date, selectedDate);
              final isToday = _isSameDay(date, DateTime.now());
              final weekdayLabel = _weekdayLabels[date.weekday - 1];

              return GestureDetector(
                onTap: () => _selectDate(date),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 80.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF3D5CFF) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.blue2
                          : isToday
                          ? AppColors.blue2.withAlpha(400)
                          : Colors.grey.shade200,
                      width: isToday && !isSelected ? 1.5 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${date.day}',
                        style: AppTextStyle.font24White500.copyWith(
                          color: isSelected ? Colors.white : AppColors.blue2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        weekdayLabel,
                        style: AppTextStyle.font12White400.copyWith(
                          color: isSelected ? Colors.white : AppColors.blue2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showMonthYearPicker(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: displayedMonth,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 100),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null) {
      setState(() {
        displayedMonth = DateTime(picked.year, picked.month);
        monthDates = _generateDatesForMonth(displayedMonth);
        selectedDate = picked;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }
}

class ButtonBlocBuilder extends StatelessWidget {
  const ButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewAppointmentCubit, NewAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<NewAppointmentCubit>();

        if (!cubit.firstDone) {
          return const SizedBox.shrink();
        }

        if (state.submissionStatus == SubmissionStatus.loading) {
          return const CircularProgressIndicator();
        }

        return CustomFloatingActionButton(
          onPressed: () {
            debugPrint('Selected Date: ${state.appointmentDate}');
            context.pushNamed(
              Routes.patientDetailsScreen,
              arguments: context.read<NewAppointmentCubit>(),
            );
          },
          title: 'Next',
        );
      },
    );
  }
}
