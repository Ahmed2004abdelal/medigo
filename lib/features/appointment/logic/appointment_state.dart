import 'package:freezed_annotation/freezed_annotation.dart';

import '../../home/data/models/appointment_model.dart';

part 'appointment_state.freezed.dart';
@freezed
abstract class AppointmentState with _$AppointmentState {
  const factory AppointmentState({
    @Default(AppointmentStatus.initial) AppointmentStatus upcomingStatus,
    @Default([]) List<AppointmentModel> upcomingAppointments,
    String? upcomingError,

    @Default(AppointmentStatus.initial) AppointmentStatus completedStatus,
    @Default([]) List<AppointmentModel> completedAppointments,
    String? completedError,

    @Default(AppointmentStatus.initial) AppointmentStatus cancelledStatus,
    @Default([]) List<AppointmentModel> cancelledAppointments,
    String? cancelledError,
  }) = _AppointmentState;
}

enum AppointmentStatus { initial, loading, success, error }