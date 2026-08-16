import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:medigo/features/appointment/logic/appointment_state.dart';

import '../data/repo/appointment_repository.dart';

enum AppointmentFilter { upcoming, completed, cancelled }

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepository _appointmentRepository;
  // final NewAppointmentRepository _newAppointmentRepository ;

  AppointmentCubit(this._appointmentRepository)
    : super(const AppointmentState()) {
    loadAppointments(AppointmentFilter.upcoming);
  }

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) return '—';
    return DateFormat('dd MMM, yyyy').format(dateTime.toLocal());
  }

  String formatTime(DateTime? dateTime) {
    if (dateTime == null) return '—';
    return DateFormat('hh:mm a').format(dateTime.toLocal());
  }

  Future<void> loadAppointments(AppointmentFilter filter) async {
    switch (filter) {
      case AppointmentFilter.upcoming:
        emit(state.copyWith(upcomingStatus: AppointmentStatus.loading));
      case AppointmentFilter.completed:
        emit(state.copyWith(completedStatus: AppointmentStatus.loading));
      case AppointmentFilter.cancelled:
        emit(state.copyWith(cancelledStatus: AppointmentStatus.loading));
    }

    final response = switch (filter) {
      AppointmentFilter.upcoming =>
        await _appointmentRepository.fetchUpcomingAppointments(),
      AppointmentFilter.completed =>
        await _appointmentRepository.fetchCompletedAppointments(),
      AppointmentFilter.cancelled =>
        await _appointmentRepository.fetchCancelledAppointments(),
    };

    if (isClosed) return;

    response.fold(
      (failure) => switch (filter) {
        AppointmentFilter.upcoming => emit(
          state.copyWith(
            upcomingStatus: AppointmentStatus.error,
            upcomingError: failure.message,
          ),
        ),
        AppointmentFilter.completed => emit(
          state.copyWith(
            completedStatus: AppointmentStatus.error,
            completedError: failure.message,
          ),
        ),
        AppointmentFilter.cancelled => emit(
          state.copyWith(
            cancelledStatus: AppointmentStatus.error,
            cancelledError: failure.message,
          ),
        ),
      },
      (appointments) => switch (filter) {
        AppointmentFilter.upcoming => emit(
          state.copyWith(
            upcomingStatus: AppointmentStatus.success,
            upcomingAppointments: appointments,
          ),
        ),
        AppointmentFilter.completed => emit(
          state.copyWith(
            completedStatus: AppointmentStatus.success,
            completedAppointments: appointments,
          ),
        ),
        AppointmentFilter.cancelled => emit(
          state.copyWith(
            cancelledStatus: AppointmentStatus.success,
            cancelledAppointments: appointments,
          ),
        ),
      },
    );
  }

  Future<void> cancelAppointment(String appointmentId) async {
    emit(state.copyWith(cancelledStatus: AppointmentStatus.loading));

    final response = await _appointmentRepository.cancelAppointment(
      appointmentId,
    );

    if (isClosed) return;

    response.fold(
      (failure) => emit(
        state.copyWith(
          cancelledStatus: AppointmentStatus.error,
          cancelledError: failure.message,
        ),
      ),
      (_) async {
        await loadAppointments(AppointmentFilter.upcoming);
        await loadAppointments(AppointmentFilter.cancelled);
      },
    );
  }
}
